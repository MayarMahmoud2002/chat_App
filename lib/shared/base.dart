import 'package:flutter/material.dart';

abstract class BaseNavigator
{
  void showloading({String message});
  void showMessege(String message);
  void hideloading();

}
class BaseViewModel <NAV extends BaseNavigator> extends ChangeNotifier
{
  NAV? navigator = null;

  // void readRooms()
  // {
  // }

}
abstract class BaseView<T extends StatefulWidget,VM extends BaseViewModel> extends State<T> implements BaseNavigator
{
  late VM viewModel;
  VM initViewModel();


  @override
  void initState() {
    // TODO: implement initState
    viewModel=initViewModel();

  }
  @override
  void hideloading() {
    Navigator.pop(context);
    setState(() {

    });
  }

  @override
  void showMessege(String message) {
    showDialog(context: context, builder: (context)    {
      return AlertDialog(
        content: Text(message),
      );

    }
    );

  }

  @override
  void showloading({String message = 'loading'}) {
    showDialog(context: context, builder: (context)
    {
      return AlertDialog(
        title: Center(child:
        Row(
          children: [
            Text(message),
            CircularProgressIndicator(),
          ],
        ),),
      );
    });
  }

}