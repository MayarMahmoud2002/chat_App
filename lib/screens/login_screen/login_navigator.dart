import 'package:chat_app/models/my_user.dart';
import 'package:chat_app/shared/base.dart';

abstract class loginNavigator extends BaseNavigator
{
  void goToHome(MyUser myUser);

}
