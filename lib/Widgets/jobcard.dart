import 'package:flutter/material.dart';

import '../constants.dart';
import 'main_action_button.dart';

class JobCard extends StatelessWidget {
  final String label;
  final Function onPressed;

  JobCard({this.label,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 400,
      decoration: BoxDecoration(
        color: kLightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Software Developer',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Google Inc.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '₹ 50000',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: MainActionButton(
              label: label,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}