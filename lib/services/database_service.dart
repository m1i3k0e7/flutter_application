import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  Future savingUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "height": 0,
      "weight": 0,
      "age": 0,
      "uid": uid,
    });
  }

  Future initialUserData(double height, double weight, int age) async {
    return await userCollection.doc(uid).update({
      "height": height,
      "weight": weight,
      "age": age,
      //"gender": gender,
      "uid": uid,
    });
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  Future<int> getAge(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    QueryDocumentSnapshot firstDocumentSnapshot = snapshot.docs[0];
    try {
      int age = firstDocumentSnapshot.get('age');
      return age;
    } catch (e) {
      // Handle the exception here
      print('Error getting age: $e');
      // Return a default value or rethrow the exception
      return 0;
    }
  }

  Future<int> getHeight(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    QueryDocumentSnapshot firstDocumentSnapshot = snapshot.docs[0];
    try {
      int height = firstDocumentSnapshot.get('height');
      return height;
    } catch (e) {
      // Handle the exception here
      print('Error getting height: $e');
      // Return a default value or rethrow the exception
      return 0;
    }
  }

  Future<int> getWeight(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    QueryDocumentSnapshot firstDocumentSnapshot = snapshot.docs[0];
    try {
      int weight = firstDocumentSnapshot.get('weight');
      return weight;
    } catch (e) {
      // Handle the exception here
      print('Error getting weight: $e');
      // Return a default value or rethrow the exception
      return 0;
    }
  }
}
