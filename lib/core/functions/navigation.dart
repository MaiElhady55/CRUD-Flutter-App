import 'package:flutter/material.dart';

void navigateTo({context, router}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => router));
