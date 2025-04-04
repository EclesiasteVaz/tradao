import 'package:flutter/material.dart';
import 'package:tradao/core/themes/app_color.dart';
import 'package:tradao/core/themes/my_theme.dart';
import 'package:provider/provider.dart';

class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({
    super.key,
    required this.onFieldSubmitted,
    this.editingController,
    required this.hintText,
  });
  final Function(String) onFieldSubmitted;
  final TextEditingController? editingController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<MyTheme>().isDark;

    return TextFormField(
      minLines: 5,
      maxLines: 5,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      controller: editingController,
      decoration: InputDecoration(
        fillColor: isDark
            ? AppColor.backgroundColorTextFieldDark
            : const Color.fromARGB(255, 255, 255, 255),
        filled: true,
        contentPadding: const EdgeInsets.all(24),
        hintText: hintText,
        hintStyle: const TextStyle(fontWeight: FontWeight.w300),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: isDark ? BorderSide.none : const BorderSide(),
        ),
      ),
    );
  }
}
