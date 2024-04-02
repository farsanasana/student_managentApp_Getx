import 'dart:developer';

import 'package:get/get.dart';
import 'package:student_getx/db%20helper/db_Functions.dart';
import 'package:student_getx/model/student_model.dart';

class StndController extends GetxController {
  RxList<StudentModel> stndList = <StudentModel>[].obs;
  RxList<StudentModel> newStudentList = <StudentModel>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    isLoading.value = true;
    await fetchStudents();
    newStudentList.value = [...stndList];
    isLoading.value = false;
    super.onInit();
  }

  fetchStudents() async {
    try {
      var studentsData = await DbFunctions.getAllData();
      // print(studentsData);
      List<StudentModel> students = studentsData.map((student) {
        return StudentModel(
            id: student['id'],
            name: student['name'],
            age: student['age'],
            gender: student['gender'],
            images: student['images'],
            phone: student['phone']);
      }).toList();
      stndList.assignAll(students);
      runFilter("");
    } catch (e) {
      log("$e");
    }
  }

  runFilter(String query) {
    if (query.isEmpty) {
      newStudentList.value = [...stndList];
    } else {
      newStudentList.value = stndList
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
