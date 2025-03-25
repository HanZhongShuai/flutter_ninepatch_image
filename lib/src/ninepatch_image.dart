import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_pixels/image_pixels.dart';

import 'ninepatch_cache.dart';
import 'ninepatch_info.dart';

typedef NinePatchDefaultWidgetBuilder = Widget Function(
    BuildContext context, Widget child);

class NinePatchImage extends StatelessWidget {
  final bool hideLines;
  final AlignmentGeometry? alignment;
  final double scale;
  final Color? color;
  final BorderRadius? borderRadius;
  final ImageProvider imageProvider;
  final Widget child;
  final NinePatchDefaultWidgetBuilder? defaultBuilder;

  /// unique cache key
  final String sliceCachedKey;

  const NinePatchImage({
    super.key,
    required this.imageProvider,
    required this.child,
    required this.sliceCachedKey,
    this.defaultBuilder,
    this.alignment,
    this.scale = 1.0,
    this.color,
    this.borderRadius,
    this.hideLines = true,
  });

  NinePatchImage.asset({
    super.key,
    required String name,
    required this.child,
    this.defaultBuilder,
    this.alignment,
    this.scale = 1.0,
    this.color,
    this.borderRadius,
    this.hideLines = true,
  })  : imageProvider = AssetImage(name),
        sliceCachedKey = name;

  NinePatchImage.file({
    super.key,
    required File file,
    required this.child,
    this.defaultBuilder,
    this.alignment,
    this.scale = 1.0,
    this.color,
    this.borderRadius,
    this.hideLines = true,
  })  : imageProvider = FileImage(file),
        sliceCachedKey = file.path;

  NinePatchImage.network({
    super.key,
    required String url,
    required this.child,
    this.defaultBuilder,
    this.alignment,
    this.scale = 1.0,
    this.color,
    this.borderRadius,
    this.hideLines = true,
  })  : imageProvider = NetworkImage(url),
        sliceCachedKey = url;

  @override
  Widget build(BuildContext context) {
    final config = NinepatchCache.instance.get(key: sliceCachedKey);
    if (config != null) {
      return _getContent(context, config);
    } else {
      return ImagePixels(
        imageProvider: imageProvider,
        builder: (context, img) {
          var width = img.width;
          var height = img.height;
          if (!img.hasImage || width == null || height == null) {
            return defaultBuilder?.call(context, child) ?? child;
          }
          if (width < 1 || height < 1) {
            return defaultBuilder?.call(context, child) ?? child;
          }

          var left1 = -1;
          var left2 = -1;

          var top1 = -1;
          var top2 = -1;

          var right1 = -1;
          var right2 = -1;

          var bottom1 = -1;
          var bottom2 = -1;

          for (var i = 0; i < height; i++) {
            var color = img.pixelColorAt!(0, i);
            if (color == Colors.black) {
              if (left1 == -1) {
                left1 = i;
              }
              if (left1 != -1) {
                left2 = i;
              }
            }
            var rightColor = img.pixelColorAt!(width - 1, i);
            if (rightColor == Colors.black) {
              if (right1 == -1) {
                right1 = i;
              }
              if (right1 != -1) {
                right2 = i;
              }
            }
          }

          for (var i = 0; i < img.width!; i++) {
            var color = img.pixelColorAt!(i, 0);
            if (color == Colors.black) {
              if (top1 == -1) {
                top1 = i;
              }
              if (top1 != -1) {
                top2 = i;
              }
            }
            var bottomColor = img.pixelColorAt!(i, height - 1);
            if (bottomColor == Colors.black) {
              if (bottom1 == -1) {
                bottom1 = i;
              }
              if (bottom1 != -1) {
                bottom2 = i;
              }
            }
          }
          double leftOffset = 1;
          double topOffset = 1;
          if (left1 == left2) {
            left2 = left1 + 1;
            leftOffset = leftOffset + 1;
          }
          if (top1 == top2) {
            top2 = top1 + 1;
            topOffset = topOffset + 1;
          }
          if (right1 == right2) right2 = right1 + 1;
          if (bottom1 == bottom2) bottom2 = bottom1 + 1;

          if (left1 == -1) left1 = 0;
          if (left2 == -1) left2 = height;

          if (top1 == -1) top1 = 0;
          if (top2 == -1) top2 = width;

          if (right1 == -1) right1 = 0;
          if (right2 == -1) right2 = height;

          if (bottom1 == -1) bottom1 = 0;
          if (bottom2 == -1) bottom2 = width;

          final padding = EdgeInsets.fromLTRB(
              bottom1.toDouble(),
              right1.toDouble(),
              width - bottom2.toDouble(),
              height - right2.toDouble());
          final constraints = BoxConstraints(
            minWidth: (width - (top2 - top1)).toDouble() + topOffset,
            minHeight: (height - (left2 - left1)).toDouble() + leftOffset,
          );
          final centerSlice = Rect.fromLTRB(top1.toDouble(), left1.toDouble(),
              top2.toDouble(), left2.toDouble());
          final info = NinepatchInfo(
            width: width,
            height: height,
            padding: padding.isNonNegative ? padding : EdgeInsets.zero,
            constraints: constraints,
            centerSlice: centerSlice,
          );
          NinepatchCache.instance.add(
            key: sliceCachedKey,
            value: info,
          );
          return _getContent(context, info);
        },
      );
    }
  }

  Widget _getContent(BuildContext context, NinepatchInfo? info) {
    if (info != null) {
      return ClipPath(
        clipper: _BlackLineClipper(hideLines: hideLines, scale: scale),
        child: IntrinsicWidth(
          child: Container(
            padding: info.padding / scale,
            constraints: info.constraints / scale,
            decoration: BoxDecoration(
              color: color,
              borderRadius: borderRadius,
              image: DecorationImage(
                image: imageProvider,
                // fit: BoxFit.fill,
                centerSlice: Rect.fromLTRB(
                    info.centerSlice.left / scale,
                    info.centerSlice.top / scale,
                    info.centerSlice.right / scale,
                    info.centerSlice.bottom / scale),
                scale: scale,
              ),
            ),
            alignment: alignment,
            child: child,
          ),
        ),
      );
    } else {
      return defaultBuilder?.call(context, child) ?? child;
    }
  }
}

class _BlackLineClipper extends CustomClipper<Path> {
  final bool hideLines;
  final double scale;

  _BlackLineClipper({
    required this.hideLines,
    required this.scale,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    double x = hideLines ? 2 / scale : 0;
    path.moveTo(x, x);
    path.lineTo(x, size.height - x);
    path.lineTo(size.width - x, size.height - x);
    path.lineTo(size.width - x, x);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_BlackLineClipper oldClipper) => true;
}
