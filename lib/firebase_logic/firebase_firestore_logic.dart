import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreLogic {
  final _firestore = FirebaseFirestore.instance;

  Future<Stream<QuerySnapshot>> getCoursesList()async{
    try{
      return _firestore.collection("courses").snapshots();
    } catch(e){
      return _firestore.collection("courses").snapshots();
    }
  }
}