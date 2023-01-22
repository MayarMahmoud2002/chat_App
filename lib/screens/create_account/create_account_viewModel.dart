import 'package:chat_app/components/firebase_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
//viewModel
class createAccountViewModel extends ChangeNotifier
{
  void createAccountlisteners(String email , String password)
  async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password:password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == fireBaseErrors.passwordError) {
        print('The password provided is too weak.');
      } else if (e.code == fireBaseErrors.mailError) {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    // return null;
  }

}