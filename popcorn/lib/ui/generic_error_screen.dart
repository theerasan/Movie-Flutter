import 'package:flutter/material.dart';
import 'package:popcorn/ui/error_screen.dart';

import '../l10n/app_localizations.dart';
import 'core/error_action.dart';

class GenericErrorScreen extends StatelessWidget {
  final Function() onRetry;

  const GenericErrorScreen({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return ErrorScreen(
      errorMessage: AppLocalizations.of(context)?.general_error_message,
      imagePath: 'images/general_error.png',
      action: ErrorAction(
        label: AppLocalizations.of(context)?.general_error_button,
        onClick: onRetry,
      ),
    );
  }
}
