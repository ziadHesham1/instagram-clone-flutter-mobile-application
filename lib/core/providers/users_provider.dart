import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import '../globals/global_variables.dart';

class UsersModel {
  final String id;
  final String name;
  final String email;
  final String imgPath;
  bool isLoggedIn;
  List<String> postsIds;
  Set<String> followings;
  Set<String> followers;

  UsersModel({
    required this.id,
    required this.name,
    required this.imgPath,
    required this.isLoggedIn,
    required this.postsIds,
    required this.followings,
    required this.followers,
    required this.email,
  });
}

class UsersProvider with ChangeNotifier {
  final List<UsersModel> _users = [
    UsersModel(
        id: 'AhmedId1',
        name: 'Ahmed Elsayed',
        imgPath: GlobalVariables.anonymousImg,
        isLoggedIn: false,
        postsIds:['Postid1'],
        followings: {},
        followers: {},
        email: 'AhmedElsayed12@gmail.com'),
         UsersModel(
        id: 'ZiadId1',
        name: 'Ziad Hesham',
        imgPath: GlobalVariables.ziadImg,
        isLoggedIn: false,
        postsIds:['Postid5'],
        followings: {},
        followers: {},
        email: 'Ziadhesham280@gmail.com'),
    UsersModel(
        id: 'TarekId2',
        name: 'Mohamed Tarek',
        imgPath: GlobalVariables.tarekImg,
        isLoggedIn: true,
        postsIds:['Postid2'],
        followings: {},
        followers: {},
        email: 'MohamedTarek1@gmail.com'),
    UsersModel(
        id: 'MostafaId2',
        name: 'Mostafa Ramadan',
        imgPath: GlobalVariables.mostafaImg,
        isLoggedIn: false,
        postsIds:['Postid3'],
        followings: {},
        followers: {},
        email: 'MostafaRamadan@gmail.com'),
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
    var user = _users.firstWhereOrNull((user) => user.isLoggedIn == true);
    return user;
  }

  void toggleLoggedInUser(userId) {
    var user = findUserById(userId);
    // user.isLoggedIn = !user.isLoggedIn;
    var userLogged = _users.firstWhereOrNull((user) => user.isLoggedIn == true);
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

// follow functions
  bool isContaining(Set<String> firstList, secondId) {
    return firstList.any((element) => element == secondId);
  }

  void follow(firstId, secondId) {
    if (firstId != secondId) {
      var firstFollowings = findUserById(firstId).followings;
      var secondFollowers = findUserById(secondId).followers;

      // the first id index in the second list
      var firstIndex = isContaining(firstFollowings, secondId);
      // the second id index in the first list
      var secondIndex = isContaining(secondFollowers, firstId);

      if (!firstIndex) {
        secondFollowers.add(firstId);
      } else {
        secondFollowers.remove(firstId);
      }

      if (!secondIndex) {
        firstFollowings.add(secondId);
      } else {
        firstFollowings.remove(secondId);
      }
    }
  }
}
