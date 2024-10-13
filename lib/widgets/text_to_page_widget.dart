import 'package:animopo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextToPageWidget extends StatelessWidget {
  final String? text;
  final void Function()? onTap;

  const TextToPageWidget({
    super.key,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      splashColor: Constants.hightlightColor.withOpacity(0.2),
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text ?? 'Explore More',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Constants.textHighlightColor,
            ),
          ),
        ],
      ),
    );
  }
}
