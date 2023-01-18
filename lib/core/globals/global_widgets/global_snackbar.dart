import 'package:flutter/material.dart';

import '../global_variables.dart';

class GlobalSnackbar {
  static show(ctx, String content) {
    ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static showWithAction(ctx, String content, actionLabel, actionFunction) {
    ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: actionLabel,
          onPressed: actionFunction,
        ),
      ),
    );
  }




static showWithLoginAction(ctx, String content) {
    ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'LOGIN',
          onPressed: () {
                    GlobalVariables.homeScaffoldKey.currentState!.openDrawer();
                  },
        ),
      ),
    );
  }
}
