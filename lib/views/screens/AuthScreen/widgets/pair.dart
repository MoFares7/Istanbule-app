import 'package:flutter/material.dart';

class Pair {
  final String text;
  final IconData icon;
  const Pair(this.text, this.icon);

  @override
  String toString() {
    return text;
  }
}
