import 'package:flutter/material.dart';
import 'package:movies_app/ui/theme/dimens.dart';
import 'package:movies_app/ui/theme/text_styles.dart';
import 'package:movies_app/ui/utils/validators.dart';

class FormInput extends StatefulWidget {
  const FormInput({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
    this.obscureText = false,
    this.onIconTap,
    this.validator,
    this.controller,
  });

  final String label;
  final String hint;
  final IconData? icon;
  final bool obscureText;
  final VoidCallback? onIconTap;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusNode.requestFocus(),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              spreadRadius: 5,
              offset: const Offset(0, 2),
              blurRadius: 16,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: semibold_12.copyWith(
                color: Colors.grey.shade700,
              ),
            ),
            height_4,
            TextFormField(
              controller: widget.controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: regular_14,
              cursorColor: Colors.black,
              obscureText: widget.obscureText,
              validator: widget.validator ?? requiredValidator,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: widget.hint,
                suffixIcon: widget.icon != null
                    ? GestureDetector(
                        onTap: widget.onIconTap,
                        child: Icon(widget.icon, size: 24),
                      )
                    : null,
                suffixIconConstraints: const BoxConstraints(maxHeight: 24),
                errorMaxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
