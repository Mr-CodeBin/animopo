import 'dart:ui';

import 'package:animopo/utils/constants.dart';
import 'package:flutter/material.dart';

class SpecificContentDataWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? imageUrl;

  const SpecificContentDataWidget({
    super.key,
    required this.title,
    required this.description,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(
      //   minHeight: 200,
      //   maxHeight: MediaQuery.of(context).size.height * 0.8,
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl ?? Constants.defaultNetworkImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              description,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
