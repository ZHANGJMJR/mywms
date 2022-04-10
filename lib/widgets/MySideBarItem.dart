import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'myextension.dart';

class MySideBarItem extends StatelessWidget {
  MySideBarItem(
      {required this.title, required this.svgSrc, required this.onTap, this.val=0,this.selected=false,Key? key})
      : super(key: key);
  final String title,svgSrc;
  //final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  final int val;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      title: '$title'.toLabel(color: Colors.grey, fontsize: 14),
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.black,
        height: 16,
      ),
      trailing: this.val > 0 ? CircleAvatar(
      backgroundColor: Colors.pink,
      radius: 10,
      child: val.toString().toLabel(fontsize: 10),
    ):null,onTap: this.onTap,
    );
  }
}
