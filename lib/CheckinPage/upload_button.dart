import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget {
  Function callback;
  static File? file;

  UploadButton(this.callback);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showFilePicker();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(
          width: 1,
          color: Color.fromARGB(255, 34, 99, 192),
        ),
      ),
      child: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
          child: Row(
            children: [
              Image.asset(
                'Assets/upload_icon.png',
                height: 40,
              ),
              Spacer(),
              Text(
                'Upload Vaccination Cert.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 34, 99, 192),
                  fontSize: 18,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showFilePicker() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      file = File(result.files.single.path!);
      callback.call(true);
    } else {
      // User canceled the picker
    }
  }
}
