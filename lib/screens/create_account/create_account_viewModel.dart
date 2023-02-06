import 'package:chat_app/DatabaseUtils/database_utils.dart';
import 'package:chat_app/models/my_user.dart';
import 'package:chat_app/shared/base.dart';
import 'package:chat_app/components/firebase_errors.dart';
import 'package:chat_app/screens/create_account/create_account_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//viewModel
class createAccountViewModel extends BaseViewModel<CreateAccountNavigator>
{
  var auth = FirebaseAuth.instance;
  void createAccountlisteners(String email , String password , String fName , String lName)
  async {
    try {
      navigator!.showloading();

      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password:password,
      );
      navigator!.hideloading();
      navigator!.showMessege("Account Created");
      // add user to DataBase
      MyUser myUser = MyUser(id: credential.user!.uid??"", fName: fName, lName: lName, email: email);
      DatabaseUtils.AddUserToFirestore(myUser).then((value)
      {
        navigator!.hideloading();
        navigator!.goToHome(myUser);
        return;

      });


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