import 'package:flutter/material.dart';
import 'package:skill_swap/core/utils/style.dart';
import 'package:skill_swap/core/widget/components/sectioncard.dart';
import 'package:skill_swap/core/widget/components/skills_section.dart';
import 'package:skill_swap/core/widget/layout/body.layout.dart';
import 'package:skill_swap/core/widget/components/input.dart';
import 'package:skill_swap/core/widget/button/filled.widget.dart';
import 'package:skill_swap/core/widget/button/outlined.widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final offeredController = TextEditingController();
  final wantedController = TextEditingController();

  String selectedAvailability = 'Weekends';
  String selectedVisibility = 'Public';

  final List<String> availabilityOptions = [
    'Weekdays',
    'Weekends',
    'Evenings',
    'Anytime',
  ];

  final List<String> visibilityOptions = ['Public', 'Private', 'Friends Only'];

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
    return BodyLayout(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: AxStyle.cardDecoration,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/profile_placeholder.png',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Edit Your Profile",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, color: Colors.blueAccent),
                        tooltip: "Edit Photo",
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.redAccent,
                        ),
                        tooltip: "Remove Photo",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            buildCard(
              title: "About",
              icon: Icons.person_outline,
              child: Column(
                children: [
                  InputField(controller: nameController, hintText: "Name"),
                  const SizedBox(height: 12),
                  InputField(
                    controller: locationController,
                    hintText: "Location",
                  ),
                ],
              ),
              context: context,
            ),

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
              title: "Preferences",
              icon: Icons.settings_outlined,
              child: Column(
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(canvasColor: Colors.white),
                    child: DropdownButtonFormField<String>(
                      value: selectedAvailability,
                      items: availabilityOptions
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ),
                          )
                          .toList(),
                      onChanged: (val) =>
                          setState(() => selectedAvailability = val!),
                      decoration: InputDecoration(
                        labelText: "Availability",
                        border: AxButtonStyle.enableInputBorder,
                        focusedBorder: AxButtonStyle.focusedInputBorder,
                        contentPadding: AxButtonStyle.innerPadding,
                        prefixIcon: const Icon(Icons.access_time),
                        filled: true,
                        fillColor: AxStyle.secondaryBgColor.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Theme(
                    data: Theme.of(context).copyWith(canvasColor: Colors.white),
                    child: DropdownButtonFormField<String>(
                      value: selectedVisibility,
                      isExpanded: true,
                      items: visibilityOptions
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ),
                          )
                          .toList(),
                      onChanged: (val) =>
                          setState(() => selectedVisibility = val!),
                      decoration: InputDecoration(
                        labelText: "Profile Visibility",
                        border: AxButtonStyle.enableInputBorder,
                        focusedBorder: AxButtonStyle.focusedInputBorder,
                        contentPadding: AxButtonStyle.innerPadding,
                        prefixIcon: const Icon(Icons.visibility_outlined),
                        filled: true,
                        fillColor: AxStyle.secondaryBgColor.withValues(alpha:  0.1),
                      ),
                    ),
                  ),
                ],
              ),
              context: context,
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: AxFilledButton(label: "Save", onPressed: () {}),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AxOutlinedButton(label: "Discard", onPressed: () {}),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
