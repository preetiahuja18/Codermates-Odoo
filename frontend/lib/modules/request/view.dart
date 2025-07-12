import 'package:flutter/material.dart';
import 'package:skill_swap/core/model/user.model.dart';
import 'package:skill_swap/core/widget/button/filled.widget.dart';
import 'package:skill_swap/core/widget/components/input.dart';
import 'package:skill_swap/core/widget/components/sectioncard.dart';
import 'package:skill_swap/core/widget/components/skills_section.dart';
import 'package:skill_swap/core/widget/layout/body.layout.dart';

class RequestSwap extends StatefulWidget {
  final AxUserModel userModel;

  const RequestSwap({super.key, required this.userModel});

  @override
  State<RequestSwap> createState() => _RequestSwapState();
}

class _RequestSwapState extends State<RequestSwap> {
  final offeredController = TextEditingController();
  final wantedController = TextEditingController();
  final message = TextEditingController();

  final skillsOffered = <String>[];
  final skillsWanted = <String>[];

  void addSkill(List<String> list, TextEditingController controller) {
    final text = controller.text.trim();
    if (text.isNotEmpty && !list.contains(text)) {
      setState(() => list.add(text));
    }
    controller.clear();
  }

  void removeSkill(List<String> list, int index) {
    setState(() => list.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    final int? roundRating = double.tryParse(
      widget.userModel.rating ?? "",
    )?.round();
    String ratingStar = "";
    if (roundRating != null) {
      for (int i = 0; i < roundRating; i++) {
        ratingStar = "$ratingStar ⭐";
      }
    }

    return BodyLayout(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            buildCard(
              title: "Skills",
              icon: Icons.build_outlined,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSkillInput(
                    "Add Skill Offered",
                    offeredController,
                    () => addSkill(skillsOffered, offeredController),
                  ),
                  const SizedBox(height: 8),
                  if (skillsOffered.isNotEmpty)
                    buildSkillChips(
                      skillsOffered,
                      (i) => removeSkill(skillsOffered, i),
                    ),
                  const SizedBox(height: 16),
                  buildSkillInput(
                    "Add Skill Wanted",
                    wantedController,
                    () => addSkill(skillsWanted, wantedController),
                  ),
                  const SizedBox(height: 8),
                  if (skillsWanted.isNotEmpty)
                    buildSkillChips(
                      skillsWanted,
                      (i) => removeSkill(skillsWanted, i),
                    ),
                ],
              ),
              context: context,
            ),
            buildCard(
              context: context,
              title: "Meaage",
              icon: Icons.message,
              child: InputField(
                controller: message,
                hintText: "Meaage",
                maxLine: 5,
              ),
            ),
          ],
        ),
      ),
      bottomWidget: AxFilledButton(label: "Submit", onPressed: () {}),
    );
  }
}
