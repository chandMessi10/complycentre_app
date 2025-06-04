import 'package:flutter/material.dart';

extension CustomSnackBarExtension on BuildContext {
  Size get mqSize => MediaQuery.of(this).size;
}
