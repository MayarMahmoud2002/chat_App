import 'package:chat_app/shared/base.dart';
import 'package:chat_app/components/firebase_errors.dart';
import 'package:chat_app/screens/create_account/create_account_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//viewModel
class createAccountViewModel extends BaseViewModel<CreateAccountNavigator>
{
  void createAccountlisteners(String email , String password)
  async {
    try {
      navigator!.showloading();

      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password:password,
      );
      navigator!.hideloading();
      navigator!.showMessege("Account Created");


    } on FirebaseAuthException catch (e) {
      if (e.code == fireBaseErrors.passwordError) {
        navigator!.hideloading();
        navigator!.showMessege("The password provided is too weak.");


      } else if (e.code == fireBaseErrors.mailError) {
        navigator!.hideloading();
        navigator!.showMessege("The account already exists for that email.");

      }
    } catch (e) {
      navigator!.hideloading();
      navigator!.showMessege(e.toString());

    }
    // return null;
  }

}