import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sys;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  const ImageInput({super.key, required this.onSelectImage});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  Future<void> _takenPicture() async {
    // final picker = ImagePicker();
    final pick = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 600);
    // final imageFile = await picker.pickImage(
    //   source: ImageSource.camera,
    //   maxWidth: 600,
    // );
    if (pick == null) {
      return;
    } else {}
    setState(() {
      _storedImage = File(pick.path);
    });

    final appDir = await sys.getApplicationDocumentsDirectory();
    final fileName = path.basename(pick.path);
    final saveImage = await pick.saveTo('${appDir.path}/$fileName');
    widget.onSelectImage(saveImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'No image available',
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: TextButton.icon(
              onPressed: _takenPicture,
              icon: const Icon(Icons.camera),
              label: const Text('Take picture')),
        )
      ],
    );
  }
}
