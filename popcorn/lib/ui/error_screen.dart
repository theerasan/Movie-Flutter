import 'package:flutter/material.dart';
import 'package:popcorn/ui/core/sizing.dart';

import 'core/error_action.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    required this.errorMessage,
    required this.imagePath,
    this.action,
  });

  final String? errorMessage;
  final String imagePath;
  final ErrorAction? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizing.xxl),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: AppSizing.errorImageSize),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            BoxSizing.xl,
            if (action != null && action!.label != null)
              ElevatedButton(
                onPressed: action!.onClick,
                child: Text(action!.label!),
              ),
          ],
        ),
      ),
    );
  }
}
