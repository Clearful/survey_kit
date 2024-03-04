import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(BuildContext context, {String hint = ''}) => InputDecoration(
      contentPadding: const EdgeInsets.only(
        left: 10,
        bottom: 10,
        top: 10,
        right: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.zero,
        ),
        borderSide: BorderSide(
          color: Theme.of(context).inputDecorationTheme.labelStyle?.color ?? Colors.blue,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.zero,
        ),
        borderSide: BorderSide(
          color: Theme.of(context).inputDecorationTheme.labelStyle?.color ?? Colors.blue,
        ),
      ),
      hintText: hint,
      labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
    );
