import 'package:flutter/cupertino.dart';
import 'package:skill_swap/core/model/user.model.dart';
import 'package:skill_swap/core/utils/navigation.dart';
import 'package:skill_swap/core/widget/button/filled.widget.dart';
import 'package:skill_swap/core/widget/layout/body.layout.dart';
import 'package:skill_swap/modules/request/view.dart';

class UserDetails extends StatefulWidget {

  final AxUserModel userModel;

  const UserDetails({
    super.key,
    required this.userModel
  });

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  @override
  Widget build(BuildContext context) {
    return BodyLayout(
      body: Column(
        children: [

        ],
      ),
      bottomWidget: AxFilledButton(
        label: "Request",
        onPressed: () {
          naviagteTo(context: context, widget: RequestSwap(userModel: widget.userModel));
        }
      ),
    );
  }
}