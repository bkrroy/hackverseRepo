import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService extends ChangeNotifier {
  final FirebaseFirestore _firestore;

  FirestoreService(this._firestore);

  String _joinCode;
  String _createdCode;
  String _currentEmail;

  // when you have joined the game then

  String _truth1 = "";
  String _truth2 = "";
  String _lie = "";

  // This is used to get the joining code
  Future<void> getJoinCode({String code, Future<String> email}) async {
    _joinCode = code;
    _currentEmail = await email;
    print(_joinCode);
    print(_currentEmail);

    var doc_ref = await _firestore.collection('gameCode').doc(_joinCode).get();

    print(doc_ref.data().values);
  }

  // This is used to get the creating code
  createrJoinCode(
      {String gameCode,
      String playerCount,
      String roundCount,
      String time}) async {
    Map<String, dynamic> codeData = {
      "player count": playerCount,
      "round count": roundCount,
      "time": time,
    };

    _createdCode = gameCode;

    _firestore.collection('gameCode').doc(gameCode).set(codeData);
  }

  // This is to return the created code
  String getCreatedCode() {
    return _createdCode;
  }

  // This function will return the join code
  String returnJoinedCode() {
    return _joinCode;
  }

  truthAndLieData({String truth1, String truth2, String lie}) {
    Map<String, dynamic> lieData = {
      "Truth 1": truth1,
      "Truth 2": truth2,
      "lie": lie,
    };

    print(lieData);

    _firestore
        .collection('gameCode')
        .doc(_createdCode)
        .collection('trueFalse')
        .doc('data')
        .set(lieData);
  }
  // changed something
  createUser({String code}) {
    Map<String, dynamic> score = {
    "email_id": _currentEmail,
    "score": 0.toString(),
    };

    print('Created code : $_createdCode');

    _firestore
        .collection('gameCode')
        .doc(code)
        .collection('userScore').add(score);
  }

  Future<void> userScore(int updatedScore) async{

    Map<String, dynamic> score = {
      "email_id": _currentEmail,
      "score": 0.toString(),
    };


  }

  Future<void> listenTruthAndLieData() async {
    var getValue = await _firestore
        .collection('gameCode')
        .doc(_joinCode)
        .collection('trueFalse')
        .doc('data')
        .get();

    //_truth1 = getValue.data().values.toList()[0].toString();
    _truth2 = getValue.data().values.toList()[1].toString();
    _lie = getValue.data().values.toList()[2].toString();

    notifyListeners();

    truthTwo();
    lieOne();
  }

  String turth01;

  // To return First Truth
  String truthOne(){
    _firestore.collection('gameCode').doc(_joinCode).collection('trueFalse').snapshots().listen((snapShots) {
      var data = snapShots.docs[0].data();
      print(data.values);
      this._truth1 = data.values.toList()[0].toString();

    });
    notifyListeners();
    return this._truth1;
  }

  // TO return the second Truth value
  String truthTwo(){
    notifyListeners();
    return _truth2;
  }

  // To return the lie value
  String lieOne(){
    notifyListeners();
    return _lie;
  }

  // To return the current user email id
  String currentLogIn(){
    return _currentEmail;
  }
}
