
import 'package:chat_app/addRoom/add_room_screen.dart';
import 'package:chat_app/providers/my_provider.dart';
import 'package:chat_app/screens/create_account/create_account.dart';
import 'package:chat_app/screens/home_screen/home_screen.dart';
import 'package:chat_app/screens/login_screen/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    var provider =  Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: provider.firebaseUser!=null? HomeScreen.routeName: loginView.routeName,
      routes:
      {
        accountScreen.routeName : (h) => accountScreen(),
        loginView.routeName:(log) => loginView(),
        HomeScreen.routeName:(home) => HomeScreen(),
        AddRoomScreen.routeName :(room) => AddRoomScreen(),
      } ,
      theme:ThemeData.light() ,
      darkTheme:ThemeData.dark() ,
      themeMode: ThemeMode.light,

    );
  }
}

