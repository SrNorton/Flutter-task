import 'dart:typed_data';


class User {

  final String name;
  final List<int> imagem;

  User({required this.name, required this.imagem});

  factory User.fromMap(Map<String, dynamic> map){


    return User(
      name: map['name'] as String,
       imagem: map['image'] as List<int>,
       );
    
    
    
  }
}