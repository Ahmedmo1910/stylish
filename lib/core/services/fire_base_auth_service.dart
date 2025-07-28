import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stylish/core/errors/exceptions.dart';

class FireBaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('[Register Error] ${e.code}: ${e.message}');
      switch (e.code) {
        case 'weak-password':
          throw CustomException(message: 'The password provided is too weak.');
        case 'email-already-in-use':
          throw CustomException(
              message: 'The account already exists for that email.');
        case 'invalid-email':
          throw CustomException(message: 'The email address is not valid.');
        case 'network-request-failed':
          throw CustomException(message: 'Network error. Please try again.');
        default:
          throw CustomException(message: 'An unknown error occurred');
      }
    } catch (e) {
      log('[Register Unknown Error]: $e');
      throw CustomException(message: 'An unknown error occurred: $e');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('[Login Error] ${e.code}: ${e.message}');
      switch (e.code) {
        case 'user-not-found':
        case 'wrong-password':
          throw CustomException(message: 'Invalid email or password.');
        case 'invalid-email':
          throw CustomException(message: 'The email address is not valid.');
        case 'network-request-failed':
          throw CustomException(message: 'Network error. Please try again.');
        default:
          throw CustomException(message: 'An unknown error occurred');
      }
    } catch (e) {
      log('[Login Unknown Error]: $e');
      throw CustomException(message: 'An unknown error occurred: $e');
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw CustomException(message: 'Google sign-in cancelled.');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return (await _firebaseAuth.signInWithCredential(credential)).user!;
    } on FirebaseAuthException catch (e) {
      log('[Google SignIn Error] ${e.code}: ${e.message}');
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(
          message:
              'Account exists with a different sign-in method. Try using another provider.',
        );
      }
      throw CustomException(message: 'Google sign-in failed.');
    } catch (e) {
      log('[Google SignIn Unknown Error]: $e');
      throw CustomException(message: 'An unknown error occurred: $e');
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status != LoginStatus.success ||
          loginResult.accessToken == null) {
        throw CustomException(message: 'Facebook sign-in cancelled.');
      }

      final OAuthCredential facebookCredential =
          FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );

      return (await _firebaseAuth.signInWithCredential(facebookCredential))
          .user!;
    } on FirebaseAuthException catch (e) {
      log('[Facebook SignIn Error] ${e.code}: ${e.message}');
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(
          message:
              'Account exists with a different sign-in method. Try using that provider.',
        );
      }
      throw CustomException(message: 'Facebook sign-in failed.');
    } catch (e) {
      log('[Facebook SignIn Unknown Error]: $e');
      throw CustomException(message: 'An unknown error occurred: $e');
    }
  }
}
