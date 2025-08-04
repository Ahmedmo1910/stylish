import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_colors.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset:const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        autofillHints: const [
          AutofillHints.email,
          AutofillHints.password,
          AutofillHints.name,
          AutofillHints.telephoneNumber
        ],
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          fillColor: const Color(0xFFFFFFFF),
          hintText: 'Search any Product..',
          hintStyle: AppTextStyles.regular16.copyWith(
            color: const Color(0xFFBBBBBB),
          ),
          filled: true,
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFFBBBBBB),
          ),
          suffixIcon: const Icon(
            Icons.filter_list,
            color: Color(0xFFBBBBBB),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xFFF5F5F5),
        width: 1,
      ),
    );
  }
}
