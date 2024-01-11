// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

class UserModel {
  int idUser;
  String email;
  String username;
  String passwordd;

  UserModel(
    this.idUser,
    this.email,
    this.username,
    this.passwordd,
  );
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        int.parse(json["id_user"]),
        json["email"],
        json["username"],
        json["passwordd"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser.toString(),
        "email": email,
        "username": username,
        "passwordd": passwordd,
      };
}
