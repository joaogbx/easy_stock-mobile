import 'package:flutter/material.dart';

enum FeedbackType {
  success,
  error,
}

void showSnackBarFeedback({
  required BuildContext context,
  required String message,
  required FeedbackType feedbackType,
}) {
  final color = feedbackType == FeedbackType.success
      ? const Color.fromARGB(255, 53, 255, 137)
      : const Color.fromARGB(255, 202, 31, 82);

  final icon = feedbackType == FeedbackType.success
      ? Icon(
          Icons.check_box_outlined,
          color: Colors.white,
        )
      : Icon(
          Icons.warning_amber_rounded,
          color: Colors.white,
        );

  final snackBar = SnackBar(
    content: Row(
      children: [
        icon,
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.all(10),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
