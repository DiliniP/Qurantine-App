import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizapp2/views/home.dart';

class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();


  Map<String,dynamic> userToAdd;
  CollectionReference collectionReference = Firestore.instance.collection("patients");
  
  addPatientDetails(){
    userToAdd={
      "name" : nameController.text,
      "id" : idController.text,
      "address" : addressController.text,
      "mobile" : mobileController.text,
    };
    collectionReference.add(userToAdd).whenComplete(
            () {print("Patient details has been added");
            showAlertDialog(context);

            nameController.clear();
            idController.clear();
            addressController.clear();
            mobileController.clear();
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
      content: Text("Patient Details Successfully added"),
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
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage())),
        ),
        title: Text("Add Patient"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            _buildTextField(nameController, "Name"),
            SizedBox(
              height: 20,
            ),
            _buildTextField(idController, "Id"),
            SizedBox(
              height: 20,
            ),
            _buildTextField(addressController, "Address"),
            SizedBox(
              height: 20,
            ),
            _buildTextField(mobileController, "Mobile"),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {
                addPatientDetails();
              },
              padding: const EdgeInsets.all(16.0),
              child: Text("Submit Patient Details",style: TextStyle(color: Colors.white),),
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
