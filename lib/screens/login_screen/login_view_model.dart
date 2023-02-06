
import 'package:chat_app/DatabaseUtils/database_utils.dart';
import 'package:chat_app/screens/login_screen/login_navigator.dart';
import 'package:chat_app/shared/base.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/my_user.dart';

class loginViewModel extends BaseViewModel<loginNavigator> {
  var auth = FirebaseAuth.instance;
  String message = '';

  void loginAccountlisteners(String email, String password) async {
    try {
      navigator!.showloading();

      final credential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      message= 'Successfully logged';

      //read user from DataBase
      MyUser? myUser = await DatabaseUtils.readUserFromFirestore(credential.user!.uid);
      if (myUser != null)
      {
        navigator!.hideloading();
        navigator!.goToHome(myUser);
        return;

      }

    } on FirebaseAuthException catch (e) {
      message= 'Wrong in email or Password';

    } catch (e) {
      navigator!.hideloading();
      navigator!.showMessege(e.toString());
    }
    if(message!='')
    {
      navigator!.hideloading();
      navigator!.showMessege(message);
    }
    // return null;
  }
}
