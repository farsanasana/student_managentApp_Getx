import 'package:flutter/material.dart';

class EditIconOnImage extends StatelessWidget {
  const EditIconOnImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
        right: 70,
        top: 100,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
        ));
  }
}
