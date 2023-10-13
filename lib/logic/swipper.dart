// ignore_for_file: must_be_immutable

import 'package:drag_widgets/core/size_widget.dart';
import 'package:drag_widgets/widget/item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SwipperWidget extends StatefulWidget {
  Widget child;
  dynamic adjustment;
  double? width, height;
  SwipperWidget(
      {Key? key, required this.child, this.adjustment, this.height, this.width})
      : super(key: key);

  @override
  State<SwipperWidget> createState() => _SwipperWidgetState();
}

class _SwipperWidgetState extends State<SwipperWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double width = deviceWidth * 0.44, height = deviceHeight * 0.8;

  Offset? offsetItem;
  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 5), vsync: this);
    offsetItem = Offset(widget.width ?? width, widget.height ?? height);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(
        '$width,$height',
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
