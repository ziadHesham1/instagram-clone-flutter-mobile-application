import 'package:instagram_clone/core/app_strings.dart';

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

class UsersProvider {
  final _users = [
    UsersModel(
      userId: 'userId1',
      name: 'Ziad Hesham',
      imgPath: ziadImgPath,
    ),
    UsersModel(
      userId: 'userId2',
      name: 'Mostafa Ramadan',
      imgPath: 'ziad_img.jpeg',
    ),
    UsersModel(
      userId: 'userId2',
      name: 'Mohamed Tarek',
      imgPath: 'ziad_img.jpeg',
    ),
  ];
  get users => [..._users];

  UsersModel findUserById(userId) =>
      _users.firstWhere((user) => user.userId == userId);
}
