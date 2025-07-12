import 'package:skill_swap/core/utils/extentions.dart';

class AxSkillModel {
  late final String? id;
  late final String? name;

  AxSkillModel({
    dynamic id,
    dynamic name
  }) {
    this.id = id.validString;
    this.name = name.validString;
  }

  AxSkillModel.fromMap({data}) {
    if(data is Map) {
      AxSkillModel(
        id: data['id'],
        name: data['name'],
      );
    }
  }


  static List<AxSkillModel> getSkilList({required data}) {
    List<AxSkillModel> skillList = [];

    final List rawList = data is List ? data : [data];

    for (var skill in rawList) {
      AxSkillModel skillModel = AxSkillModel.fromMap(data: skill);
      if(skillModel.id != null && skillModel.name != null) {
        skillList.add(skillModel);
      }
    }

    return skillList;
  }

}