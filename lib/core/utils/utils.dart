import 'package:flutter/material.dart';

EdgeInsetsGeometry classlyPadding({
  double? top,
  double? left,
  double? right,
  double? bottom,
}) => EdgeInsets.only(
  top: top ?? 32,
  left: left ?? 24,
  right: right ?? 24,
  bottom: bottom ?? 0,
);
