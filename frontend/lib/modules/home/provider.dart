import 'package:flutter/material.dart';
import 'package:skill_swap/core/model/user.model.dart';

class HomeProvider extends ChangeNotifier {

  final BuildContext context;

  bool isApiCalling = false;

  List<AxUserModel> users = [];

  HomeProvider({required this.context});

  void fetchInitalData() async {
    isApiCalling = true;
    _notify();

    await Future.delayed(Duration(seconds: 3));

    isApiCalling = false;
    _notify();


  }

  void _notify() {
    if(context.mounted) {
      notifyListeners();
    }
  }


}