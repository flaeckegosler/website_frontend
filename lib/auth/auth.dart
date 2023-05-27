import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _firstName = '';
  String _lastName = '';
  String _instrument = '';

  User? get user {
    return _firebaseAuth.currentUser;
  }

  GoslerUser get goslerUser {
    return GoslerUser(
      uid: user!.uid,
      email: user!.email,
      firstName: _firstName,
      lastName: _lastName,
      instrument: _instrument,
    );
  }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String instrument,
  }) async {
    final UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    _addAttributesAtRegistration(
      user: userCredential.user!,
      firstName: firstName,
      lastName: lastName,
      instrument: instrument,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> addUserAttributes(User user, String instrument) async {
    final CollectionReference users = _firestore.collection('users');

    return users
        .doc(user.uid)
        .update({
          'instrument': instrument,
        }) // use update instead of set to add new attributes, otherwise it will overwrite the existing values
        .then((value) => print("User Attributes Instrument Added"))
        .catchError((error) => print("Failed to add user attributes: $error"));
  }

  Future<void> loadCurrentUserAttributes() async {
    final DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(user!.uid).get();
    if (documentSnapshot.exists) {
      _instrument = documentSnapshot['instrument'] as String;
      _firstName = documentSnapshot['firstname'] as String;
      _lastName = documentSnapshot['lastname'] as String;
      notifyListeners();
    } else {
      throw Exception("User attributes not fetched!");
    }
  }

  Future<void> _addAttributesAtRegistration({
    required User user,
    required String firstName,
    required String lastName,
    required String instrument,
  }) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    return users
        .doc(user.uid)
        .set({
          'firstname': firstName,
          'lastname': lastName,
          'instrument': instrument,
        }) // Set the firstname / lastname / instrument only once, when the user is created, otherwise it will overwrite the existing values
        .then((value) =>
            print("User attributes firstname / lastname / instrument added!"),)
        .catchError((error) => print("Failed to add user attributes: $error"));
  }
}

class GoslerUser {
  final String uid;
  final String? email;
  final String firstName;
  final String lastName;
  final String instrument;

  GoslerUser({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.instrument,
  });
}
