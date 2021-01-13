import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
              fontSize: 22
          ),
          children: <TextSpan>[
            TextSpan(text: 'Qurantine', style: TextStyle(fontWeight: FontWeight.w600
                , color: Colors.redAccent)),
            TextSpan(text: 'Supervision App', style: TextStyle(fontWeight: FontWeight.w600
                , color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
