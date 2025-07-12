import 'package:flutter/material.dart';
import 'package:skill_swap/core/widget/button/filled.widget.dart';
import 'package:skill_swap/core/widget/button/outlined.widget.dart';

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  const PaginationWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AxFilledButton(
          onPressed: currentPage > 1
            ? () => onPageChanged(currentPage - 1)
            : null,
          label: "  <  ",
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(totalPages, (index) {
              final page = index + 1;
              final isSelected = page == currentPage;
            
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: isSelected 
                  ? AxFilledButton(
                    onPressed: () {},
                    label: "  $page  ",
                  ) 
                : AxOutlinedButton(
                  onPressed: () => onPageChanged(page),
                  label: "  $page  ",
                ),
              );
            }),
              ),
            ),
          ),
        ),
        AxFilledButton(
          onPressed: currentPage < totalPages
            ? () => onPageChanged(currentPage + 1)
            : null,
          label: "  >  ",
        ),
      ],
    );
  }
}
