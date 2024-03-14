import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:provider/provider.dart';
import 'package:task_app/database/dbRepository.dart';

class StatusTask extends StatefulWidget {
  final int? idtask;
  final String? bool;
   StatusTask({required this.idtask, required this.bool});

  @override
  State<StatusTask> createState() => _StatusTaskState();
}

class _StatusTaskState extends State<StatusTask> {
  
  bool? isChecked;
  
  



  @override
  Widget build(BuildContext context) {
  
  
  var data = context.read<DbRepository>();

  isChecked = widget.bool == 'true' ? true : false;
  

  Future upDate({String? change}) async{
         await data.updateData(status: change, id: widget.idtask);

  }

    return Center(
      child: MSHCheckbox(
        size: 45,
        value: isChecked!,
        colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
          checkedColor: Colors.green,
        ),
        style: MSHCheckboxStyle.fillScaleColor,
        
        onChanged: (selected) {
          upDate(change: selected  ? 'true' : 'false');
          setState(() {
           
            isChecked = selected;
          data.readallData();


          });

        },
      ),
    );
  }
}