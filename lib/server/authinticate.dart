import 'package:fireShouldSuceess/model/user.dart';
import 'package:fireShouldSuceess/server/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  User _getUid(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_getUid);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _getUid(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerNewUser(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateData('0', 'New member', 100);
      return _getUid(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future singnInUser(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _getUid(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future logedOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
