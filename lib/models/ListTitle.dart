import 'package:flutter/material.dart';

class ListTitle {
  final String title;
  final String subtitle;
  final VoidCallback ontap;
  

  ListTitle({
    required this.title,
    required this.subtitle,
    required this.ontap,
  });
}