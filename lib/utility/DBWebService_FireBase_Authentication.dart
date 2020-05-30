
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthImplementation
{
   Future<String> SignIn(String email,String password);
   Future<String> SignUp(String email,String password);
   Future<String> getCurrentUser();
   Future<void> signOut();
}

class Auth extends AuthImplementation
{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //method for signIn with email and password.
  Future<String> SignIn(String email,String password) async
  {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }
  
  //method for signUp with email and password.
   Future<String> SignUp(String email,String password) async
  {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }
  
  //method to get the current user.
   Future<String> getCurrentUser() async
   {
     FirebaseUser user = await _firebaseAuth.currentUser();
     return user.uid;
   }



//method for signOut.
  Future<void> signOut() async
  {
    _firebaseAuth.signOut();
  }
}