import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import '../globals/global_variables.dart';

class UsersModel {
  final String id;
  final String name;
  final String imgPath;
  bool isLoggedIn;
  List<String> followings;
  List<String> followers;

  UsersModel({
    required this.id,
    required this.name,
    required this.imgPath,
    required this.isLoggedIn,
    required this.followings,
    required this.followers,
  });
}

class UsersProvider with ChangeNotifier {
  final List<UsersModel> _users = [
    UsersModel(
      id: 'ZiadId1',
      name: 'Ziad Hesham',
      imgPath: GlobalVariables.ziadImg,
      isLoggedIn: false,
      followings: [],
      followers: ['TarekId2'],
    ),
    UsersModel(
      id: 'TarekId2',
      name: 'Mohamed Tarek',
      imgPath: GlobalVariables.tarekImg,
      isLoggedIn: false,
      followings: ['ZiadId1'],
      followers: [],
    ),
    UsersModel(
      id: 'MostafaId2',
      name: 'Mostafa Ramadan',
      imgPath: GlobalVariables.mostafaImg,
      isLoggedIn: false,
      followings: [],
      followers: [],
    ),
  ];
  List<UsersModel> get users {
    return [..._users];
  }

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

  bool isContaining(firstId, secondId) {
    var list = findUserById(firstId).followings;
    return list.any((element) => element == secondId);
  }

  void follow(firstId, secondId) {
    var firstFollowings = findUserById(firstId).followings;
    var secondFollowers = findUserById(secondId).followers;

    // the second id index in the first list
    var secondIndex = isContaining(firstId, secondId);
    // the first id index in the second list
    var firstIndex = isContaining(secondId, firstId);

    if (!secondIndex) {
      firstFollowings.add(secondId);
    } else {
      firstFollowings.remove(secondId);
    }

    if (!firstIndex) {
      secondFollowers.add(firstId);
    } else {
      secondFollowers.remove(firstId);
    }
  }
}
