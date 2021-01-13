import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp2/addpatient.dart';
import 'package:quizapp2/allmisbehaviors.dart';
import 'package:quizapp2/managepatient.dart';
import 'package:quizapp2/misbehavior.dart';
import 'package:quizapp2/trackpatient.dart';
import 'package:quizapp2/widget/widget.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FirebaseAuth auth = FirebaseAuth.instance;

  signOut() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Quarantine Supervision System'),
        ),
      actions: [
        IconButton(
            icon: Icon(Icons.logout), onPressed: (){
          signOut();
        })
      ],
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
children: [
  GestureDetector(
    onTap: (){
      addPatient();
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
        padding: EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(30)),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - 48,
        child: Text(
          "Add Patient",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
    ),
  ),
  GestureDetector(
    onTap: (){
      misbehavior();
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30)),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 48,
      child: Text(
        "Add Misbehavior",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  ),
  GestureDetector(
    onTap: (){
      managePatient();
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30)),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 48,
      child: Text(
        "Manage Patient",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  ),
  GestureDetector(
    onTap: (){
      allmisbehavior();
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(30)),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 48,
      child: Text(
        "All Patient's Misbehavior",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  ),
  GestureDetector(
    onTap: (){
      trackPatient();
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30)),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 48,
      child: Text(
        "Track Patients",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  ),
],
        ),
      ),
    );
  }

  addPatient() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AddPatient()));
  }
  managePatient() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ManagePatient()));
  }
  misbehavior() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Misbehavior()));
  }
  allmisbehavior() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AllMisbehavior()));
  }
  trackPatient() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TrackPatient()));
  }
}
