import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class StatusTask extends StatefulWidget {
  const StatusTask({super.key});

  @override
  State<StatusTask> createState() => _StatusTaskState();
}

class _StatusTaskState extends State<StatusTask> {
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: MSHCheckbox(
        size: 45,
        value: isChecked,
        colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
          checkedColor: Colors.green,
        ),
        style: MSHCheckboxStyle.fillScaleColor,
        onChanged: (selected) {
          setState(() {
            isChecked = selected;
          });
        },
      ),
    );
  }
}