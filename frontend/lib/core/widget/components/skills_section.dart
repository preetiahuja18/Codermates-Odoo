import 'package:flutter/material.dart';
import 'package:skill_swap/core/utils/style.dart';
import 'package:skill_swap/core/widget/components/input.dart';

Widget buildSkillInput(
  String hint,
  TextEditingController controller,
  void Function() onAdd,
) {
  return Row(
    children: [
      Expanded(
        child: InputField(controller: controller, hintText: hint),
      ),
      const SizedBox(width: 8),
      ElevatedButton.icon(
        onPressed: onAdd,
        style: ElevatedButton.styleFrom(
          backgroundColor: AxStyle.primaryBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
        icon: const Icon(Icons.add, size: 18, color: Colors.white),
        label: const Text("Add", style: TextStyle(color: Colors.white)),
      ),
    ],
  );
}

Widget buildSkillChips(List<String> list, void Function(int) onRemove) {
  return Wrap(
    spacing: 8,
    runSpacing: 8,
    children: List.generate(list.length, (i) {
      return Chip(
        label: Text(list[i]),
        deleteIcon: const Icon(Icons.close),
        onDeleted: () => onRemove(i),
        backgroundColor: AxStyle.secondaryBgColor.withOpacity(0.2),
      );
    }),
  );
}
