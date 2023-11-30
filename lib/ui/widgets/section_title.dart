import 'package:flutter/material.dart';
import 'package:movies_app/ui/theme/text_styles.dart';
import 'package:movies_app/ui/utils/common_widget.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: bold_20),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
              borderRadius: BorderRadius.circular(64),
              boxShadow: lightShadow,
            ),
            child: Row(
              children: [
                Text(
                  "Vedi tutti",
                  style: regular_10.copyWith(color: Colors.white),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  size: 16,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
