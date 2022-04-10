import 'package:awesome_dialog/awesome_dialog.dart';

import '/values/constants.dart';
import 'package:flutter/material.dart';
import 'myextension.dart';

class MyLabel extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final bool bold;
  const MyLabel(this.title, {this.fontSize, this.color, this.bold = false});
  @override
  Widget build(BuildContext context) {
    return Text(
      '${this.title}',
      style: TextStyle(
          color: this.color ?? GlobalConst.textGreyColor,
          fontSize: this.fontSize ?? GlobalConst.globalTextSizeMid,
          fontWeight: this.bold ? FontWeight.bold : FontWeight.normal),
    );
  }
}

enum ButtonType { Save, New, Delete, Cancel, Other }

class MyButton extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;
  final Icon? icon;
  final ButtonType? type;
  final Color? color;
  final EdgeInsets? padding;
  const MyButton({
    this.title,
    required this.onTap,
    this.type,
    this.color,
    this.icon,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(this.color != null
                ? this.color
                : this.type == ButtonType.Save
                    ? Colors.green
                    : this.type == ButtonType.Cancel
                        ? Colors.deepOrangeAccent
                        : this.type == ButtonType.Delete
                            ? Colors.redAccent
                            : this.type == ButtonType.New
                                ? Colors.blue
                                : Colors.transparent),
            padding: MaterialStateProperty.all(this.padding)),
        child: this.type != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  this.icon != null
                      ? this.icon!
                      : this.type == ButtonType.Save
                          ? Icon(Icons.save)
                          : this.type == ButtonType.Cancel
                              ? Icon(Icons.cancel)
                              : this.type == ButtonType.Delete
                                  ? Icon(Icons.delete)
                                  : this.type == ButtonType.New
                                      ? Icon(Icons.add_box)
                                      : Icon(Icons.help_center),
                  SizedBox(
                    width: 5,
                  ),
                  this.type == ButtonType.Save
                      ? '存储'.toLabel()
                      : this.type == ButtonType.Cancel
                          ? '取消'.toLabel()
                          : this.type == ButtonType.Delete
                              ? '删除'.toLabel()
                              : this.type == ButtonType.New
                                  ? '新增'.toLabel()
                                  : this.title!.toLabel(),
                ],
              )
            : this.icon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      this.icon!,
                      SizedBox(
                        width: 5,
                      ),
                      '${this.title}'.toLabel(),
                    ],
                  )
                : MyLabel('${this.title}'));
  }
}

class MyEdit extends StatelessWidget {
  final String hint;
  final Function(String)? onChange;
  final bool autoFocus;
  final bool password;
  final TextEditingController? controller;

  const MyEdit(
      {required this.hint,
      this.onChange,
      this.controller,
      this.autoFocus = false,
      this.password = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: this.controller,
        onChanged: this.onChange,
        obscureText: this.password,
        style: TextStyle(fontSize: GlobalConst.globalTitleTextSize),
        decoration: InputDecoration(
          labelText: this.hint,
          labelStyle: TextStyle(
              color: GlobalConst.textGreyColor,
              fontSize: GlobalConst.globalTextSizeMid),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: GlobalConst.primaryColor),
              borderRadius: BorderRadius.circular(8),
              gapPadding: 20),
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 15, color: GlobalConst.primaryColor),
              borderRadius: BorderRadius.circular(8),
              gapPadding: 20),
        ));
  }
}

//
// class MyDialog extends AwesomeDialog {
//   MyDialog({required BuildContext context}) : super(context: context);
//   final DialogType dialogType;
//
//   // var mydialog=   AwesomeDialog(
//   //   context: context,
//   //   dialogType: DialogType.QUESTION,
//   //   animType: AnimType.BOTTOMSLIDE,
//   //   title: 'Dialog Title',width: 500,
//   //   desc: 'Dialog description here.............',
//   //   btnOkText: '确定',btnCancelText: '取消',
//   //   btnCancelOnPress: () {},
//   //   btnOkOnPress: () {},
//   // );
// }