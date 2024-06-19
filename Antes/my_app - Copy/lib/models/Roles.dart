// ignore_for_file: file_names, non_constant_identifier_names

class Roles {
  int?      role_Id;
  String    role_Descripcion;

  
  

  Roles({
    this.role_Id,
    required this.role_Descripcion,

  });

  factory Roles.fromJson(Map<String, dynamic> json) {
    return Roles(
      role_Id:            json['role_Id'] as int,
      role_Descripcion:       json['role_Descripcion'] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "role_Id": role_Id,
      "role_Descripcion": role_Descripcion,
    };
  }
}
