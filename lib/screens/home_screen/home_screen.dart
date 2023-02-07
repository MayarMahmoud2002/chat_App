import 'package:chat_app/addRoom/add_room_screen.dart';
import 'package:chat_app/addRoom/room_widget.dart';
import 'package:chat_app/screens/home_screen/home_navigator.dart';
import 'package:chat_app/screens/home_screen/home_view_model.dart';
import 'package:chat_app/screens/login_screen/login_view.dart';
import 'package:chat_app/shared/base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
    viewModel.readRooms();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/SIGN UP - PERSONAL.png',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddRoomScreen.routeName);
              },
              child: Icon(Icons.add),
            ),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                // child: IconButton(
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.menu,
                //     size: 35.0,
                //   ),
                // ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 30.0),
                child: Text(
                  'Your Rooms',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: (){
                      FirebaseAuth.instance.signOut();
                       Navigator.pushReplacementNamed(context, loginView.routeName);
                    },
                    icon: Icon(Icons.logout)
                )
              ],
            ),
            body:Consumer<HomeViewModel>(
              builder: (_ , homeViewModel , c)
              {
                return Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 10.0,right: 10.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      // childAspectRatio: 1/2,
                    ),
                    itemBuilder: (context , index)
                  {
                    return RoomWidget(homeViewModel.rooms[index]);
                  }, itemCount:homeViewModel.rooms.length,


                  ),
                );

              },

            ),

          ),
        ],
      ),
    );

  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }


}
