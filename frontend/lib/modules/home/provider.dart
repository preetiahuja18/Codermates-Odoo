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

    await Future.delayed(Duration(seconds: 1));
    users = AxUserModel.getUserList(data: apiRespose['users']);

    isApiCalling = false;
    _notify();


  }

  void _notify() {
    if(context.mounted) {
      notifyListeners();
    }
  }


}

final Map apiRespose = {
  'users' : [
    {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    },
     {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    },
     {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    }
    ,
     {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    },
     {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    },
     {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    },
     {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    }
    , {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    }
    , {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    }
    , {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    }, {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    }
    , {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    }
    , {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    },
     {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    },
     {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    }
    , {
      'id' : "1",
      'name' : "Ritesh Saini",
      'profile_picture' : 'https://unsplash.com/photos/a-young-man-wearing-glasses-standing-in-front-of-a-mountain-MSepzbKFz10',
      'skills_offered' : [
      
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'skills_wanted' : [
        {
          'id' : '1',
          'title' : 'C++'
        },
        
        {
          'id' : '1',
          'title' : 'Java'
        },
        
        {
          'id' : '1',
          'title' : 'Kotlin'
        },
        
        {
          'id' : '1',
          'title' : 'Java Script'
        },
        
        {
          'id' : '1',
          'title' : 'Dart'
        },
        
        {
          'id' : '1',
          'title' : 'Flutlter'
        },
      ],
      'rating' : 4.5
    
    }
  ]
};