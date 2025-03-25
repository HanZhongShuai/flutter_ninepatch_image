import 'package:flutter/material.dart';

class NinepatchInfo {
  final int width;
  final int height;
  final EdgeInsets padding;
  final BoxConstraints constraints;
  final Rect centerSlice;

  const NinepatchInfo({
    required this.width,
    required this.height,
    required this.padding,
    required this.constraints,
    required this.centerSlice,
  });
}
