import 'package:flutter/material.dart';

class NinepatchInfo {
  final int width;
  final int height;
  final EdgeInsets pading;
  final BoxConstraints constraints;
  final Rect centerSlice;

  const NinepatchInfo({
    required this.width,
    required this.height,
    required this.pading,
    required this.constraints,
    required this.centerSlice,
  });
}
