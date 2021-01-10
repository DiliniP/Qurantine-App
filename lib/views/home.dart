import 'package:flutter/material.dart';
import 'package:quizapp2/services/database.dart';
import 'package:quizapp2/widget/widget.dart';


class QuizTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [


            ],
          ),
        ),
      ),
    );
  }
}
