import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle h1(BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge!;

  static TextStyle h2(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium!;

  static TextStyle h3(BuildContext context) =>
      Theme.of(context).textTheme.headlineSmall!;

  static TextStyle bodyText(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!;

  static TextStyle caption(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!;

  static TextStyle statusText(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall!;

  static TextStyle hintText(BuildContext context) =>
      Theme.of(context).textTheme.labelSmall!;
}
