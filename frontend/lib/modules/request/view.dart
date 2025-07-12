import 'package:flutter/cupertino.dart';
import 'package:skill_swap/core/model/user.model.dart';
import 'package:skill_swap/core/widget/button/filled.widget.dart';
import 'package:skill_swap/core/widget/layout/body.layout.dart';

class RequestSwap extends StatefulWidget {

  final AxUserModel userModel;

  const RequestSwap({
    super.key,
    required this.userModel
  });

  @override
  State<RequestSwap> createState() => _RequestSwapState();
}

class _RequestSwapState extends State<RequestSwap> {
  @override
  Widget build(BuildContext context) {
    return BodyLayout(
      body: Column(
        children: [

        ],
      ),
      bottomWidget: AxFilledButton(
        label: "Submit",
        onPressed: () {
        }
      ),
    );
  }
}