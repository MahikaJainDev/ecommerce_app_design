import 'package:flutter/material.dart';

class CategoryTags extends StatelessWidget {
  const CategoryTags({super.key, required this.label});
  final String label;

  final bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 4.0,
          vertical: 16.0
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: isSelected ? Colors.black : const Color(0xffe5e5ea)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xff959598),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
