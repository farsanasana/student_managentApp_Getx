import 'package:flutter/material.dart';
import 'package:student_getx/controllers/student_controller.dart';
import 'package:student_getx/screens/student%20list/functions/functions.dart';

IconButton deleteButton(
    StndController controller, int index, BuildContext context) {
  return IconButton(
    onPressed: () {
      deleteData(controller.newStudentList[index].id!,
          controller.newStudentList[index].name, context);
    },
    icon: Icon(
      Icons.delete,
      color: Colors.red[400],
    ),
  );
}
