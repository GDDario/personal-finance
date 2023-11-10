import 'package:flutter/material.dart';

class CustomTableBorder extends TableBorder {
  const CustomTableBorder({
    BorderSide top = const BorderSide(color: Colors.black26),
    BorderSide right = const BorderSide(color: Colors.black26),
    BorderSide bottom = const BorderSide(color: Colors.black26),
    BorderSide left = const BorderSide(color: Colors.black26),
    BorderSide horizontalInside = BorderSide.none,
    BorderSide verticalInside = BorderSide.none,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4.0)),
  }) : super(
    top: top,
    right: right,
    bottom: bottom,
    left: left,
    horizontalInside: horizontalInside,
    verticalInside: verticalInside,
    borderRadius: borderRadius,
  );
  factory CustomTableBorder.symmetric({
    BorderSide? inside,
    BorderSide outside = BorderSide.none,
    BorderRadius borderRadius = BorderRadius.zero,
    BorderSide? horizontalInside,
    BorderSide? verticalInside,
  }) {
    return CustomTableBorder(
      top: outside,
      right: outside,
      bottom: outside,
      left: outside,
      horizontalInside: inside ?? horizontalInside ?? BorderSide.none,
      verticalInside: inside ?? verticalInside ?? BorderSide.none,
      borderRadius: borderRadius,
    );
  }
  bool get isUniform {
    final Color topColor = top.color;
    if (right.color != topColor ||
        bottom.color != topColor ||
        left.color != topColor) {
      return false;
    }

    final double topWidth = top.width;
    if (right.width != topWidth ||
        bottom.width != topWidth ||
        left.width != topWidth) {
      return false;
    }

    final BorderStyle topStyle = top.style;
    if (right.style != topStyle ||
        bottom.style != topStyle ||
        left.style != topStyle) {
      return false;
    }

    return true;
  }
}