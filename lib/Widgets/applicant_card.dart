import 'package:flutter/material.dart';

import '../constants.dart';
import 'main_action_button.dart';

class ApplicantCard extends StatelessWidget {
  final String name;
  final String education;
  final Function acceptOnPressed;
  final Function rejectOnPressed;

  const ApplicantCard({
    this.name,
    this.education,
    this.acceptOnPressed,
    this.rejectOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        color: kLightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              education,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                child: MainActionButton(
                  label: 'Reject',
                  onPressed: rejectOnPressed,
                ),
              ),
              SizedBox(
                width: 100,
                child: MainActionButton(
                  label: 'Accept',
                  onPressed: acceptOnPressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
