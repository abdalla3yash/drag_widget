// ignore_for_file: must_be_immutable

import 'package:drag_widgets/core/num_extensions.dart';
import 'package:drag_widgets/core/size_widget.dart';
import 'package:drag_widgets/widget/item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SwipperWidget extends StatefulWidget {
  Widget child;
  dynamic adjustment;
  SwipperWidget({Key? key, required this.child, this.adjustment})
      : super(key: key);

  @override
  State<SwipperWidget> createState() => _SwipperWidgetState();
}

class _SwipperWidgetState extends State<SwipperWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double x = deviceHeight * 0.5.h, y = deviceHeight * 0.5.h;

  Offset? offsetItem;
  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 20), vsync: this);
    offsetItem = Offset(x, y);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(
        '$x,$y',
      );
    }
    return Positioned(
      left: offsetItem!.dx,
      top: offsetItem!.dy,
      child: Draggable<String>(
        onDragStarted: () {
          if (kDebugMode) {
            print('drag started');
          }
          setState(() {
            controller.forward();
          });
        },
        feedback: AnimatedItem(
          animation: controller,
          child: widget.child,
        ),
        onDragEnd: (details) {
          setState(() {
            var a = widget.adjustment;

            controller.reverse();
            offsetItem = Offset(details.offset.dx, details.offset.dy - a);
          });
        },
        child: AnimatedItem(
          animation: controller,
          child: widget.child,
        ),
      ),
    );
  }
}
