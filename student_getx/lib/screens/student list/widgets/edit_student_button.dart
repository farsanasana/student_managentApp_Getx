import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/student_controller.dart';
import '../../edit student/student_edit.dart';

class EditButton extends StatelessWidget {
  final int index;
  const EditButton({
    super.key,
    required this.controller,
    required this.index,
  });

  final StndController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.to(
          transition: Transition.rightToLeft,
          duration: Duration(seconds: 1),
          () => StudentEdit(
              id: controller.newStudentList[index].id!,
              name: controller.newStudentList[index].name,
              age: controller.newStudentList[index].age,
              image: controller.newStudentList[index].images,
              gender: controller.newStudentList[index].gender,
              phone: controller.newStudentList[index].phone),
        );
      },
      icon: const Icon(Icons.edit),
    );
  }
}
