import 'package:chaosgames/authentication_services.dart';
import 'package:chaosgames/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JoinedScreen extends StatefulWidget {
  static const id = 'joined_screen';

  @override
  _JoinedScreenState createState() => _JoinedScreenState();
}

class _JoinedScreenState extends State<JoinedScreen> {

  String currentCode;
  String truthOne;
  String truthTwo;
  String lieOne;

  List getVal;
  fetchData(){
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('gameCode').doc(currentCode).collection('trueFalse');
    collectionReference.snapshots().listen((snapShots){
      setState(() {
        getVal = snapShots.docs[0].data().values.toList();
        print("List $getVal");

        truthOne = getVal[0].toString();
        truthTwo = getVal[1].toString();
        lieOne = getVal[2].toString();
      });
    });
  }

  press(){
    fetchData();
    print(currentCode);
    Provider.of<FirestoreService>(context, listen: false).listenTruthAndLieData();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    currentCode = Provider.of<FirestoreService>(context, listen: true).returnJoinedCode();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ChaosGames'),
          backgroundColor: Color(0xFF253A4B),
        ),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Center(
                child: Text(
                  Provider.of<FirestoreService>(context, listen: true).returnJoinedCode()??'',
                ),
              ),
              Container(
                child: Text(
                  truthOne??"",
                ),
              ),Container(
                child: Text(
                  truthTwo??"",
                ),
              ),Container(
                child: Text(
                  lieOne??"",
                ),
              ),
              FlatButton(
                child: Text('START'),
                onPressed: press,
              ),

              Container(
                child: Text('SCORE'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
