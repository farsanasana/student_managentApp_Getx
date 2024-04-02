import 'package:flutter/material.dart';
import 'package:student_getx/controllers/student_controller.dart';

class SearchBox extends StatelessWidget {
  final StndController controller;
  const SearchBox({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
      child: TextField(
        onChanged: (value) => controller.runFilter(value),
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white60, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            labelText: "search",
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            )),
      ),
    );
  }
}
