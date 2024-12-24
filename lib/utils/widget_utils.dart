import 'package:flutter/material.dart';

bool widgetContainsText(Widget widget, String text) {
  text = text.toLowerCase();

  if (widget is Text && widget.data != null) {
    return widget.data!.toLowerCase().contains(text);
  } else if (widget is ListTile) {
    if (widget.title != null && widgetContainsText(widget.title!, text)) {
      return true;
    }
    if (widget.subtitle != null && widgetContainsText(widget.subtitle!, text)) {
      return true;
    }
  } else if (widget is Column || widget is Row) {
    if (widget is MultiChildRenderObjectWidget) {
      return widget.children.any((child) => widgetContainsText(child, text));
    }
  } else if (widget is Container) {
    if (widget.child != null) {
      return widgetContainsText(widget.child!, text);
    }
  } else if (widget is SingleChildRenderObjectWidget) {
    return widget.child != null && widgetContainsText(widget.child!, text);
  }

  return false;
}
