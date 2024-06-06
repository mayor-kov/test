import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_1/common/utlis/constants/titels/titles.dart';

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(Titles.title5),
        actions: <Widget>[
          TextButton(
            child: const Text(Titles.ok),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
