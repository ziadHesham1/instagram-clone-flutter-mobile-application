import 'package:flutter/material.dart';

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
}
