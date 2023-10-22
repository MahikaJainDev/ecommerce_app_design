import 'package:flutter/material.dart';

class CategoryTags extends StatelessWidget {
  const CategoryTags({super.key, required this.label, required this.onTap, required this.selectedCategory});
  final String label;
  final VoidCallback onTap;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 4.0,
            vertical: 16.0
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: selectedCategory == label ? Colors.black : Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: selectedCategory == label ? Colors.white : null
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
