import 'package:flutter/material.dart';
import 'package:skill_swap/core/utils/extentions.dart';
import 'package:skill_swap/core/widget/button/filled.widget.dart';
import 'package:skill_swap/core/widget/button/outlined.widget.dart';
import 'package:skill_swap/core/widget/layout/body.layout.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {

                },
                icon: Row(
                  children: [
                    if(!context.isMobile)
                      Text("Avabilty"),
                    Icon(Icons.filter_alt)
                  ],
                )
              )
            ],
          ),
          AxOutlinedButton(label: "Accept", onPressed: (){}),
          SizedBox(height: 20.0,),
          AxFilledButton(label: "Accept", onPressed: (){})
        ],
      )
    );
  }
}