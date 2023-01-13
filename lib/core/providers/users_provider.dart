
import 'package:flutter/cupertino.dart';

class UsersModel {
  final String userId;
  final String name;
  final String imgPath;

  UsersModel({
    required this.userId,
    required this.name,
    required this.imgPath,
  });
}

class UsersProvider with ChangeNotifier{
  final _users = [
    UsersModel(
      userId: 'ZiadId1',
      name: 'Ziad Hesham',
      imgPath: 'images/ziad_img.jpeg',
    ),  
    UsersModel(
      userId: 'TarekId2',
      name: 'Mohamed Tarek',
      imgPath: 'images/tarek_img.png',
    ),
    UsersModel(
      userId: 'MostafaId2',
      name: 'Mostafa Ramadan',
      imgPath: 'images/tarek_img.png',
    ),
  ];
  get users => [..._users];

  UsersModel findUserById(userId) {
    return _users.firstWhere((user) {
      return user.userId == userId;
    });
  }
}
