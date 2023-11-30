import 'package:flutter/material.dart';

extension TimeStringHelper on String {
  TimeOfDay toTimeOfDay() {
    var substring = split(":");
    return TimeOfDay(
      hour: int.tryParse(substring[0]) ?? 0,
      minute: int.tryParse(substring[1]) ?? 0,
    );
  }
}
