import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color mainColor = const Color(0xFFC67C4E);

mySnackBar({required context, required String message, required ContentType contentType}) {
  final materialBanner = SnackBar(
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Error',
      message: message,
      contentType: contentType,
      inMaterialBanner: false,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentMaterialBanner()
    ..showSnackBar(materialBanner);
}



