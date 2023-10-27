import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color mainColor = const Color(0xFF001E36);
Color lightBackground = const Color(0xFFE7EFEC);
Color darkBackground = const Color(0xFF2E3239);

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



