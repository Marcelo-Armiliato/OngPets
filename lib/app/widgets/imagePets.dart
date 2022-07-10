import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ImagePets extends StatelessWidget {
  final String? imageDataBase;
  final double? widthImage;
  final double? heightImage;

  ImagePets({required this.imageDataBase, this.widthImage, this.heightImage})
      : super();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: heightImage ?? screenHeight * 0.23,
        width: widthImage ?? screenWidth * 0.8,
        color: const Color.fromARGB(255, 30, 36, 41),
        child: imageDataBase != null
            ? Image.network(
                '$imageDataBase',
                fit: BoxFit.fill,
              )
            : Container(),
      ),
    );
  }
}
