import 'package:ecommerce/decoration.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: kSecondaryColor.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: searchOutlineInputBorder,
        focusedBorder: searchOutlineInputBorder,
        enabledBorder: searchOutlineInputBorder,
        hintText: "Search product",
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
