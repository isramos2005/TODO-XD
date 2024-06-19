// ignore_for_file: file_names, non_constant_identifier_names

class Empleado {
  int?      empl_Id;
  String    empl_Nombres;
  String    empl_Apellidos;

  
  

  Empleado({
    this.empl_Id,
    required this.empl_Nombres,
    required this.empl_Apellidos,

  });

  factory Empleado.fromJson(Map<String, dynamic> json) {
    return Empleado(
      empl_Id:            json['empl_Id'] as int,
      empl_Nombres:       json['empl_Nombres'] as String,
      empl_Apellidos:     json['empl_Apellidos'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "empl_Id": empl_Id,
      "empl_Nombres": empl_Nombres,
      "empl_Apellidos": empl_Apellidos,
    };
  }
}
