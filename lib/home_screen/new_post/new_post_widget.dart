import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/globals/global_variables.dart';
import '../../core/providers/users_provider.dart';

class NewPost extends StatelessWidget {
  const NewPost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UsersProvider>(context);

    var loggedInUser = userProvider.loggedInUser();

    return Container(
      decoration: GlobalVariables.boxDecoration,
      margin: const EdgeInsets.all(10),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage(
                        loggedInUser != null
                            ? loggedInUser.imgPath
                            : GlobalVariables.anonymousImg,
                      ),
                    ),
                  ),
                  const Text(
                    'say something ...',
                    style: GlobalVariables.primaryColorTextStyle,
                  ),
                ],
              ),
              const Icon(Icons.camera_enhance)
            ],
          ),
        ),
      ),
    );
  }
}
