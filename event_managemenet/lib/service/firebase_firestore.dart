import 'package:cloud_firestore/cloud_firestore.dart';

final firebaseCloudService = FirebaseCloudService.instance;

class FirebaseCloudService {
  const FirebaseCloudService._();

  static FirebaseCloudService get instance => const FirebaseCloudService._();


  static final userCollection= FirebaseFirestore.instance.collection("user");

}


