import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireShouldSuceess/model/user.dart';
import '../model/brew.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference collectionReference =
      Firestore.instance.collection('Brew');
  Future updateData(String suger, String name, int strength) async {
    return await collectionReference
        .document(uid)
        .setData({'suger': suger, 'name': name, 'strength': strength});
  }

  List<Brew> _breList(QuerySnapshot snapshot) {
    return snapshot.documents.map((e) {
      return Brew(
          name: e.data['name'] ?? '',
          strength: e.data['strength'] ?? 0,
          suger: e.data['suger'] ?? '');
    }).toList();
  }

  UserData _userData(DocumentSnapshot snapshot) {
    return UserData(
        name: snapshot.data['name'],
        strength: snapshot.data['strength'],
        suger: snapshot.data['suger']);
  }

  Stream<List<Brew>> get brew {
    return collectionReference.snapshots().map(_breList);
  }

  Stream<UserData> get dataUser {
    return collectionReference.document(uid).snapshots().map(_userData);
  }
}
