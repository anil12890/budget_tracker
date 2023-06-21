import 'package:flutter/material.dart';

class ChartDisplay extends StatefulWidget {
  const ChartDisplay({Key? key}) : super(key: key);

  @override
  State<ChartDisplay> createState() => _ChartDisplayState();
}

class _ChartDisplayState extends State<ChartDisplay> {
  @override
  Widget build(BuildContext context) {
    return const Center(child:Text("Chart Display"));
  }
}

