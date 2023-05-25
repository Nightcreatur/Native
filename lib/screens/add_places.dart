import 'dart:io';
import 'package:device/provider/place.dart';
import 'package:device/widget/image_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPlace extends StatefulWidget {
  static const routeName = '/add-place';
  const AddPlace({super.key});

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();
  late File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ImageInput(onSelectImage: _selectImage)
              ],
            ),
          ))),
          ElevatedButton.icon(
            onPressed: _savePlace,
            icon: const Icon(Icons.add),
            label: const Text('Add place'),
          )
        ],
      ),
    );
  }
}
