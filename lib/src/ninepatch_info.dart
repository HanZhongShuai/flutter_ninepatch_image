import 'package:flutter/material.dart';

/// Ninepatch Ninepatch Info
class NinepatchInfo {
  /// image width
  final int width;

  /// image height
  final int height;

  /// [Container] padding
  final EdgeInsets padding;

  /// [Container] constraints
  final BoxConstraints constraints;

  /// [DecorationImage] centerSlice
  final Rect centerSlice;

  /// initialize method
  const NinepatchInfo({
    required this.width,
    required this.height,
    required this.padding,
    required this.constraints,
    required this.centerSlice,
  });
}
