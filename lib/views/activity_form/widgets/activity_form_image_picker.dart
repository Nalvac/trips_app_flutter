import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trips_app_flutter/provider/city_provider.dart';

class ActivityFormImagePicker extends StatefulWidget {
  const ActivityFormImagePicker({super.key});

  @override
  State<ActivityFormImagePicker> createState() =>
      _ActivityFormImagePickerState();
}

class _ActivityFormImagePickerState extends State<ActivityFormImagePicker> {
  File? _deviceImage;
  final picker = ImagePicker();

  Future<void> _pickerImage(ImageSource source) async {
    try {
      XFile? pickerFile = await picker.pickImage(source: source);

      if (pickerFile != null && mounted) {
        _deviceImage = File(pickerFile.path);

/*        final url = await Provider.of<CityProvider>(context, listen: false)
            .uploadImage(_deviceImage!);
        widget.updateUrl(url);*/
        setState(() {});
      }
      final ImagePicker imagePicker = ImagePicker();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.photo),
              label: const Text('Galerie'),
              onPressed: () => _pickerImage(ImageSource.gallery),
            ),
            TextButton.icon(
                icon: const Icon(Icons.photo_camera),
                label: const Text('camera'),
                onPressed: () => _pickerImage(ImageSource.camera)),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: _deviceImage != null
              ? Image.file(
                  _deviceImage!,
                  fit: BoxFit.cover,
                )
              : const Center(child: Text('Aucune image')),
        ),
      ],
    ));
  }
}
