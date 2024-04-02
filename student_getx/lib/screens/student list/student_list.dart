import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_getx/controllers/student_controller.dart';
import 'package:student_getx/screens/student%20list/widgets/add_student_button.dart';
import 'package:student_getx/screens/individual%20student/student_profile.dart';
import 'widgets/delete_button.dart';
import 'widgets/edit_student_button.dart';
import 'widgets/listtile_widgets.dart';
import 'widgets/search_box.dart';

class StdntListView extends StatelessWidget {
  const StdntListView({super.key});

  @override
  Widget build(BuildContext context) {
    StndController controller = Get.find();
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 18, 18, 18),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "STUDENT LIST",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.newStudentList.isEmpty
                ? Center(
                    child: Text(
                    "no students added",
                    style: TextStyle(
                        fontFamily: GoogleFonts.aboreto().fontFamily,
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ))
                : Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SearchBox(
                        controller: controller,
                      ),
                      Obx(() {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: controller.newStudentList.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                await Future.delayed(
                                    const Duration(milliseconds: 100));

                                Get.to(
                                    fullscreenDialog: false,
                                    curve: Curves.easeInOutQuart,
                                    duration: const Duration(seconds: 2),
                                    () => StudentProfile(
                                        id: controller
                                            .newStudentList[index].id!,
                                        name: controller
                                            .newStudentList[index].name,
                                        age: controller
                                            .newStudentList[index].age,
                                        images: controller
                                            .newStudentList[index].images,
                                        gender: controller
                                            .newStudentList[index].gender,
                                        phone: controller
                                            .newStudentList[index].phone));
                              },
                              child: Card(
                                color: Colors.grey,
                                margin: const EdgeInsets.all(15),
                                child: ListTile(
                                  title: CardTitle(
                                      controller: controller, index: index),
                                  leading: CardImage(
                                      controller: controller, index: index),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      EditButton(
                                          controller: controller, index: index),
                                      deleteButton(controller, index, context),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  );
      }),
      floatingActionButton: const StudentAddButton(),
    );
  }
}
