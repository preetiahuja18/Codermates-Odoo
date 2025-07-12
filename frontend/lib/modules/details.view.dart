import 'package:flutter/material.dart';
import 'package:skill_swap/core/model/user.model.dart';
import 'package:skill_swap/core/utils/navigation.dart';
import 'package:skill_swap/core/utils/style.dart';
import 'package:skill_swap/core/widget/button/filled.widget.dart';
import 'package:skill_swap/core/widget/layout/body.layout.dart';
import 'package:skill_swap/modules/home/view.dart';
import 'package:skill_swap/modules/request/view.dart';

class UserDetails extends StatefulWidget {
  final AxUserModel userModel;

  const UserDetails({super.key, required this.userModel});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25.0, width: double.infinity),
                CircleAvatar(
                  backgroundImage: Image.network(
                    "https://images.unsplash.com/photo-1654110455429-cf322b40a906?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fHww",
                  ).image,
                  radius: 90,
                ),
                if (widget.userModel.rating != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      widget.userModel.rating!,
                      style: AxStyle.secondaryTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (ratingStar.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(ratingStar),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    widget.userModel.name!,
                    style: AxStyle.secondaryTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            skillWidget(
              title: "Skils Offerd",
              skills: widget.userModel.skillsOffered,
            ),
            const SizedBox(height: 12.0),
            skillWidget(
              title: "Skils Want",
              skills: widget.userModel.skillsOffered,
            ),
          ],
        ),
      ),
      bottomWidget: AxFilledButton(
        label: "Request",
        onPressed: () {
          naviagteTo(
            context: context,
            widget: RequestSwap(userModel: widget.userModel),
          );
        },
      ),
    );
  }
}
