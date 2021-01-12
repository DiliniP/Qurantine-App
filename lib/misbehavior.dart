import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizapp2/views/home.dart';
class Misbehavior extends StatefulWidget {
  @override
  _MisbehaviorState createState() => _MisbehaviorState();
}

class _MisbehaviorState extends State<Misbehavior> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Map<String,dynamic> misbehaviorToAdd;

  CollectionReference collectionReference = Firestore.instance.collection("misbehavior");
  addMisbehavior(){
    misbehaviorToAdd={
      "name" : nameController.text,
      "description" : descriptionController.text,
    };

    collectionReference.add(misbehaviorToAdd).whenComplete(
            () {print("Patient details has been added");
        showAlertDialog(context);

        nameController.clear();
        descriptionController.clear();
        });
  }
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Notification"),
      content: Text("Patient Misbehavior added"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black87),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.green),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage())),
        ),
        title: Text("Misbehavior"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),

        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextField(nameController, "Name"),
            SizedBox(
              height: 20,
            ),
            _buildTextField(descriptionController, "Description"),
            SizedBox(
              height: 20,
            ),

            FlatButton(
              onPressed: () {
addMisbehavior();
              },
              padding: const EdgeInsets.all(16.0),
              child: Text("Add Misbehavior",style: TextStyle(color: Colors.white),),
              color: Colors.green,
            )
          ],
        ),
      ),

    );
  }
}
