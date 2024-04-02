import 'package:get/get.dart';
import 'package:student_getx/screens/add%20student/functions/functions.dart';

class StudentAddController extends GetxController {
  RxString imagpath = ''.obs;
  RxBool imageErrorVisible = false.obs;
  RxBool isPhotoSelected = false.obs;
  RxString groupValue = ''.obs;
  RxBool genderErrorVisible = false.obs;

  void initialize() {
    imagpath.value = '';
    imageErrorVisible.value = false;
    isPhotoSelected.value = false;
    groupValue.value = '';
    genderErrorVisible.value = false;
    nameController.clear();
    ageController.clear();
    phoneController.clear();
  }

  addimage(String imagePath) {
    imagpath.value = imagePath;
    isPhotoSelected.value = true;
  }

  showImageError() {
    imageErrorVisible.value = true;
  }

  selectGender(String value) {
    groupValue.value = value;
    genderErrorVisible.value = false;
  }

  showGenderError() {
    genderErrorVisible.value = true;
  }
}
