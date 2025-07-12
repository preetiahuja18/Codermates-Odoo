
  import 'package:flutter/material.dart';
import 'package:skill_swap/core/utils/style.dart';

Widget sectionTitle(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AxStyle.primaryBgColor.withOpacity(0.1),
            radius: 16,
            child: Icon(icon, size: 18, color: AxStyle.primaryBgColor),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AxStyle.black,
                ),
          ),
        ],
      ),
    );
  }


  Widget buildCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: AxStyle.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [sectionTitle(context, title, icon), child],
      ),
    );
  }