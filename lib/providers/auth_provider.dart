import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:constatel/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  User? get currentUser => _auth.currentUser;

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);

    } catch (e) {
      // Handle sign up errors
      throw e;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      // Handle sign in errors
      throw e;
    }
  }

  Future<void> saveUserInfo(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).set({
        'name': user.name,
        'phoneNumber': user.phoneNumber,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveUserId(String userId) async {
    try {
      final currentUser = _auth.currentUser;

      if (currentUser != null) {
        await _firestore.collection('users').doc(currentUser.uid).set({
          'userId': userId,
        });
      }
    } catch (e) {
      // Handle errors while saving user ID
      throw e;
    }
  }



  Future<String?> signInAsGuest() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return userCredential.user?.uid;
    } catch (e) {
      // Handle anonymous sign in errors
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      // Handle sign out errors
      throw e;
    }
  }
}
