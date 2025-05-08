import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.title, required this.index, required this.isActive, required this.activeColor, required this.onTap});
  final String title;
  final int index; // Added index parameter
  final bool isActive;
  final Color activeColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Make the tab tappable
      onTap: onTap,
      // Call the provided onTap function
      borderRadius: BorderRadius.circular(4),
      // Optional: Add ripple effect constraints
      child: Padding(
        // Add padding for better tap area and spacing
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isActive ? activeColor : Colors.grey[400],
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            // Show underline only if the tab is active
            if (isActive)
              Container(
                height: 3,
                width: 60, // Adjust width as needed
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(
                    1.5,
                  ), // Optional: Rounded corners for the line
                ),
              ),
            // Add placeholder for inactive tabs to maintain height consistency
            if (!isActive) const SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}