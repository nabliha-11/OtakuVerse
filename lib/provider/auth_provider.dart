import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../data/repositories/firebase_repository.dart';

class AuthProvider extends ChangeNotifier{
  final FirebaseRepository _firebaseRepository = FirebaseRepository();
  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<void> signUp({required String email, required String password}) async {
    _currentUser = await _firebaseRepository.signUp(email: email, password: password);
    notifyListeners();
  }

  Future<void> signIn({required String email, required String password}) async {
    _currentUser = await _firebaseRepository.signIn(email: email, password: password);
    notifyListeners();
  }

}