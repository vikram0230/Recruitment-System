import 'package:flutter/material.dart';

import '../constants.dart';
import 'main_action_button.dart';

class RespondedCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int status;

  const RespondedCard({
    this.title,
    this.subtitle, this.status,
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
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              subtitle,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            width: 150,
            child: MainActionButton(
              label: status == 1 ? 'Rejected' : 'Selected',
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}
