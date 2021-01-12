import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizapp2/views/home.dart';

class AllMisbehavior extends StatefulWidget {
  @override
  _AllMisbehaviorState createState() => _AllMisbehaviorState();
}

class _AllMisbehaviorState extends State<AllMisbehavior> {

  CollectionReference reference = Firestore.instance.collection("misbehavior");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage())),
        ),
        title: Text("All Misbehavior"),
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
                            doc['description'],
                            style: TextStyle(
                              color: Colors.blueGrey,
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
