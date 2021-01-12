import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizapp2/views/home.dart';

class ManagePatient extends StatefulWidget {
  @override
  _ManagePatientState createState() => _ManagePatientState();
}

class _ManagePatientState extends State<ManagePatient> {
  CollectionReference reference = Firestore.instance.collection("patients");
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

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
        title: Text("Manage Patient"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        child: StreamBuilder(
          stream: reference.snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    var doc = snapshot.data.documents[index].data;
                    return ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.edit),
                        color: Colors.green,
                        onPressed: (){
                     nameController.text=doc['name'];
                     idController.text=doc['id'];
                     mobileController.text=doc['mobile'];
                     addressController.text=doc['address'];


showDialog(context: context,builder: (context)=>Dialog(
  child: Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
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
              snapshot.data.documents[index].reference.updateData({
                "name" : nameController.text,
                "id" : idController.text,
                "address" : addressController.text,
                "mobile" : mobileController.text,
              }).whenComplete(() => Navigator.pop(context));
            },
            padding: const EdgeInsets.all(16.0),
            child: Text("Update Patient Details",style: TextStyle(color: Colors.white),),
            color: Colors.green,
          ),
          SizedBox(height: 20,),
          FlatButton(
            onPressed: () {
              snapshot.data.documents[index].reference.delete().whenComplete(() => Navigator.pop(context));
            },
            padding: const EdgeInsets.all(16.0),
            child: Text("Delete",style: TextStyle(color: Colors.white),),
            color: Colors.red,
          )
        ],
      ),
    ),
  ),
));
                        },
                      ),
                      title: Text(
                        doc['name'],
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doc['id'],
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            doc['mobile'],
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            doc['address'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
            return Container(
              child: Text("No Patient records"),
            );
          },
        ),
      ),
    );
  }
}
