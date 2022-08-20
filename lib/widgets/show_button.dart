// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';

import 'package:viewstudent/widgets/show_text.dart';

class ShowButton extends StatelessWidget {
  final String label;
  final Function() pressFunc;
  final Color? colorPrimary;
  const ShowButton({
    Key? key,
    required this.label,
    required this.pressFunc,
    this.colorPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ElevatedButton.styleFrom(primary: colorPrimary ?? MyConstant.primary),
      onPressed: pressFunc,
      child: ShowText(
        text: label,
        textStyle: colorPrimary == null
            ? MyConstant().h2WhiteStyle()
            : MyConstant().h2RedStyle(),
      ),
    );
  }
}
