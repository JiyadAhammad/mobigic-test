import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../home/home_screen.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({
    super.key,
    required this.row,
    required this.column,
  });

  final String row;
  final String column;

  @override
  Widget build(BuildContext context) {
    final List<List<int>> list = List<List<int>>.generate(
      int.parse(row),
      (int i) => List<int>.filled(int.parse(column), 0),
    );

    log('$list');
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: 'viewScreen',
      ),
      backgroundColor: bgColor,
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              backgroundColor: kblack,
              style: TextStyle(
                color: kwhiteText,
              ),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: kwhiteIcon,
              ),
              suffixIcon: Icon(
                CupertinoIcons.xmark_circle_fill,
                color: kwhiteIcon,
              ),
            ),
          ),
          _buildGameBody(list, row, column),
        ],
      ),
    );
  }
}

Widget _buildGameBody(
  List<List<int>> list,
  String row,
  String column,
) {
  final int rowLength = int.parse(row);
  final int columnLength = int.parse(column);
  log('$rowLength lenth row');
  log('$columnLength lenth column');
  final int a = rowLength * columnLength;
  return Column(children: <Widget>[
    AspectRatio(
      aspectRatio: 1.0,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnLength,
        ),
        itemBuilder: (BuildContext context, int index) {
          // int x, y = 0;
          // x = (index / rowLength).floor();
          // y = index % columnLength;
          // log('$x x value');
          // log('$y y value');
          return GestureDetector(
            child: GridTile(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: a,
      ),
    ),
  ]);
}
