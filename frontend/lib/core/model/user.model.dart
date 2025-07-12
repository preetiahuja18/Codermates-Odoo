import 'package:skill_swap/core/model/skil.model.dart';
import 'package:skill_swap/core/utils/extentions.dart';

class AxUserModel {
  late final String? id;
  late final String? name;
  late final String? profilePicture;
  late final List<AxSkillModel>? skillsOffered;
  late final List<AxSkillModel>? skillsWanted;
  late final String? rating;

  AxUserModel({
    dynamic id,
    dynamic name,
    dynamic profilePicture,
    dynamic skillsOffered,
    dynamic skillsWanted,
    dynamic rating,
  }) {
    this.id = id.validString;
    this.name = name.validString;
    this.profilePicture = profilePicture.validString;
    this.skillsOffered = AxSkillModel.getSkilList(data: skillsOffered);
    this.skillsWanted = AxSkillModel.getSkilList(data: skillsWanted);
    this.rating = id.rating;
  }

  AxUserModel.fromMap({data}) {
    if(data is Map) {
      AxUserModel(
        id: data['id'],
        name: data['name'],
      );
    }
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