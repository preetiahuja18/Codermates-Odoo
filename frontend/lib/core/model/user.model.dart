import 'package:skill_swap/core/model/skil.model.dart';
import 'package:skill_swap/core/utils/parser.dart';

class AxUserModel {
  late final String? id;
  late final String? name;
  late final String? profilePicture;
  late final List<AxSkillModel> skillsOffered;
  late final List<AxSkillModel> skillsWanted;
  late final String? rating;

  AxUserModel({
    dynamic id,
    dynamic name,
    dynamic profilePicture,
    dynamic skillsOffered,
    dynamic skillsWanted,
    dynamic rating,
  }) {
    this.id = pasreString(id);
    this.name = pasreString(name);
    this.profilePicture = pasreString(profilePicture);
    this.skillsOffered = AxSkillModel.getSkilList(data: skillsOffered);
    this.skillsWanted = AxSkillModel.getSkilList(data: skillsWanted);
    this.rating = pasreString(rating);
  }

  factory AxUserModel.fromMap({data}) {
    if(data is Map) {
      return AxUserModel(
        id: data['id'],
        name: data['name'],
        profilePicture: data['profile_picture'],
        skillsOffered: data['skills_offered'],
        skillsWanted: data['skills_wanted'],
        rating: data['rating'],
      );
    }

    return AxUserModel();
  }


  static List<AxUserModel> getUserList({required data}) {
    List<AxUserModel> userList = [];

    final List rawList = data is List ? data : [data];

    for (var user in rawList) {
      AxUserModel userModel = AxUserModel.fromMap(data: user);
      if(userModel.id != null && userModel.name != null) {
        userList.add(userModel);
      }
    }

    return userList;
  }

}