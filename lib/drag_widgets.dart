// ignore_for_file: must_be_immutable

library drag_widgets;

import 'package:drag_widgets/logic/swipper.dart';
import 'package:flutter/widgets.dart';

class DragWidget extends StatefulWidget {
  List items;
  Widget? child;
  double? width, height;

  DragWidget(
      {super.key, required this.items, this.height, this.width, this.child});

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: List.generate(
          widget.items.length,
          (index) {
            return Stack(children: [
              Positioned(child: widget.child ?? const SizedBox()),
              for (int i = 0; i < 1; i++)
              SwipperWidget(
                height: widget.height,
                width: widget.width,
                adjustment:
                    MediaQuery.of(context).size.height - constraints.maxHeight,
                child: Image.asset(
                  widget.items[index],
                ),
              ),
            ]);
          },
        ),
      );
    });
  }
}
