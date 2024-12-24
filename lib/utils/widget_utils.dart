import 'package:flutter/material.dart';

bool widgetContainsText(Widget widget, String text) {
  if (widget is Text && widget.data != null) {
    return widget.data!.toLowerCase().contains(text.toLowerCase());
  } else if (widget is ListTile) {
    if (widget.title is Text && (widget.title as Text).data != null) {
      if ((widget.title as Text)
          .data!
          .toLowerCase()
          .contains(text.toLowerCase())) {
        return true;
      }
    }
    if (widget.subtitle is Text && (widget.subtitle as Text).data != null) {
      if ((widget.subtitle as Text)
          .data!
          .toLowerCase()
          .contains(text.toLowerCase())) {
        return true;
      }
    }
  } else if (widget is MultiChildRenderObjectWidget) {
    return widget.children.any((child) => widgetContainsText(child, text));
  } else if (widget is SingleChildRenderObjectWidget) {
    return widget.child != null && widgetContainsText(widget.child!, text);
  }
  return false;
}
