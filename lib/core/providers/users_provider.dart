import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class UsersModel {
  final String id;
  final String name;
  final String imgPath;
  bool isLoggedIn;

  UsersModel({
    required this.id,
    required this.name,
    required this.imgPath,
    required this.isLoggedIn,
  });
}

class UsersProvider with ChangeNotifier {
  final List<UsersModel> _users = [
    UsersModel(
      id: 'ZiadId1',
      name: 'Ziad Hesham',
      imgPath: 'images/ziad_img.jpeg',
      isLoggedIn: false,
    ),
    UsersModel(
      id: 'TarekId2',
      name: 'Mohamed Tarek',
      imgPath: 'images/tarek_img.png',
      isLoggedIn: false,
    ),
    UsersModel(
      id: 'MostafaId2',
      name: 'Mostafa Ramadan',
      imgPath: 'images/mostafa_img.JPG',
      isLoggedIn: false,
    ),
  ];
  List<UsersModel> get users => [..._users];

  UsersModel findUserById(userId) {
    return _users.firstWhere((user) {
      return user.id == userId;
    });
  }

  UsersModel? loggedInUser() {
    var firstWhereOrNull =
        _users.firstWhereOrNull((user) => user.isLoggedIn == true);
    return firstWhereOrNull;
  }

  void toggleLoggedInUser(userId) {
    var user = findUserById(userId);
    // user.isLoggedIn = !user.isLoggedIn;
    var userLogged = loggedInUser();
    // FIRST LOGIN
    if (userLogged == null && user.isLoggedIn == false) {
      user.isLoggedIn = true;
    }
    // FIRST LOGOUT
    else if (userLogged == user) {
      user.isLoggedIn = false;
    }
    // SWITCH
    else if (userLogged != null && user.isLoggedIn == false) {
      userLogged.isLoggedIn = false;
      user.isLoggedIn = true;
    }

    notifyListeners();
  }
}
