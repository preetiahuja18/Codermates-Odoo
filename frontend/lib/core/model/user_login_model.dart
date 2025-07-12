class AxUserLoginModel {
  final String? email;
  final String? accessToken;
  final String? refreshToken;
  final String? msg;
  final int? flag;

  AxUserLoginModel({
    this.email,
    this.accessToken,
    this.refreshToken,
    this.msg,
    this.flag,
  });

  factory AxUserLoginModel.fromJson(Map<String, dynamic> json) {
    return AxUserLoginModel(
      email: json['email'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      msg: json['msg'],
      flag: json['flag'],
    );
  }
}
