import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(List<String> args) {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: image_picker(),
    );
  }
}

class image_picker extends StatefulWidget {
  const image_picker({super.key});
  @override
  State<image_picker> createState() => _image_pickerState();
}

class _image_pickerState extends State<image_picker> {
  File? selectedImage;
  Future select_image(ImageSource img) async {
    final image = await ImagePicker().pickImage(source: img);
    if (selectedImage == null) return;
    setState(() {
      selectedImage = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => select_image(ImageSource.camera),
                  child: Text('camera')),
              ElevatedButton(
                  onPressed: () => select_image(ImageSource.gallery),
                  child: Text('galery')),
              selectedImage != null
                  ? Image.file(selectedImage!)
                  : Text('selecione uma imagem'),
            ],
          ),
        ),
      ),
    );
  }
}
