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
    required this.value,
  });

  final String row;
  final String column;
  final String value;

  @override
  Widget build(BuildContext context) {
    log('$value thid id bslur in psgr');
    final List<List<int>> list = List<List<int>>.generate(
      int.parse(row),
      (int i) => List<int>.filled(int.parse(column), 0),
    );
    // List<int>? valueEnterd = [];
    // if (value == null) {
    //   log('null');
    // } else {
    //   valueEnterd.add(
    //     int.parse(value),
    //   );
    // }
    // log('$valueEnterd vlue entered');
    log('$list');
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: 'viewScreen',
      ),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
            _buildGameBody(list, row, column, value),
          ],
        ),
      ),
    );
  }
}

Widget _buildGameBody(
  List<List<int>> list,
  String row,
  String column,
  String number,
) {
  final List<dynamic> b = <dynamic>[];
  b.add(int.parse(number));
  log('${b.length} lenth of alist');
  log('$b valu in method');
  final int rowLength = int.parse(row);
  final int columnLength = int.parse(column);
  log('$rowLength lenth row');
  log('$columnLength lenth column');
  final int a = rowLength * columnLength;
  log('message');
  b.extend(a, '');
  log('$a item count');
  log('$number value ');
  return SingleChildScrollView(
    child: AspectRatio(
      aspectRatio: 0.5,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnLength,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: GridTile(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                  ),
                ),
                child: Center(
                  child: Text('${b[index]}'),
                ),
              ),
            ),
          );
        },
        itemCount: a,
      ),
    ),
  );
}

extension ExtendList<T> on List<T> {
  void extend(int newLength, T defaultValue) {
    assert(newLength >= 0);

    final int lengthDifference = newLength - length;
    if (lengthDifference <= 0) {
      return;
    }

    addAll(
      List.filled(
        lengthDifference,
        defaultValue,
      ),
    );
  }
}
