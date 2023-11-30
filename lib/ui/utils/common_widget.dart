import 'package:flutter/material.dart';

const SizedBox height_4 = SizedBox(height: 4);
const SizedBox height_8 = SizedBox(height: 8);
const SizedBox height_16 = SizedBox(height: 16);
const SizedBox height_24 = SizedBox(height: 24);

final filler = Expanded(child: Container());

final lightShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.08),
    spreadRadius: 5,
    offset: const Offset(0, 2),
    blurRadius: 16,
  )
];

final imageShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.25),
    spreadRadius: 2,
    offset: const Offset(0, 2),
    blurRadius: 24,
  )
];
