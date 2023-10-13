// ignore_for_file: must_be_immutable

import 'package:drag_widgets/core/size_widget.dart';
import 'package:drag_widgets/drag_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List items = [
    'assets/x.png',
    'assets/o.png',
    'assets/x.png',
    'assets/o.png',
    'assets/x.png',
    'assets/o.png',
    'assets/x.png',
    'assets/o.png',
    'assets/x.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drag Widget Example")),
      body: DragWidget(
        items: items,

        /// table form for x-o game
        child: Center(
          child: SizedBox(
            width: deviceWidth * 0.8,
            child: Table(border: TableBorder.all(), children: const [
              TableRow(children: [
                Text('\n\n', maxLines: 3),
                Text('\n\n', maxLines: 3),
                Text('\n\n', maxLines: 3),
              ]),
              TableRow(children: [
                Text('\n\n', maxLines: 3),
                Text('\n\n', maxLines: 3),
                Text('\n\n', maxLines: 3),
              ]),
              TableRow(children: [
                Text('\n\n', maxLines: 3),
                Text('\n\n', maxLines: 3),
                Text('\n\n', maxLines: 3),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
