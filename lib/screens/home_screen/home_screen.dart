import 'package:chat_app/screens/chat_app/chat_app.dart';
import 'package:chat_app/screens/home_screen/home_navigator.dart';
import 'package:chat_app/screens/home_screen/home_view_model.dart';
import 'package:chat_app/shared/base.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView <HomeScreen , BaseViewModel> implements HomeNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.navigator=this;
  }
  @override
  Widget build(BuildContext context) {
    return ChatApp();
  }

  @override
  BaseViewModel<BaseNavigator> initViewModel() {
    return HomeViewModel();
  }
}
