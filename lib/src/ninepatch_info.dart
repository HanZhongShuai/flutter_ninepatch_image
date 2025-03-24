import 'package:flutter/material.dart';

class NinepatchInfo {
  final EdgeInsets pading;
  final BoxConstraints constraints;
  final Rect centerSlice;
  final double scale;

  const NinepatchInfo({
    required this.pading,
    required this.constraints,
    required this.centerSlice,
    required this.scale,
  });
}
