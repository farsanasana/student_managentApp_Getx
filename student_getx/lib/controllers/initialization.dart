import 'package:get/get.dart';
import 'package:student_getx/controllers/student_add_controller.dart';
import 'package:student_getx/controllers/student_controller.dart';
import 'package:student_getx/controllers/student_edit_controller.dart';

class InitializeControllers implements Bindings {
  @override
  void dependencies() {
    Get.put(StndController());
    Get.put(StudentAddController());
    Get.put(StudentEditController());
  }
}
