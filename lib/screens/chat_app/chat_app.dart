import 'package:chat_app/addRoom/add_room_screen.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
static const routeName = 'ChatApp';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Image.asset('assets/images/SIGN UP - PERSONAL.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: ()
            {
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
              child: IconButton(
                onPressed: () {  },
                icon: Icon(
                  Icons.menu,
                  size: 35.0,
                ),

              ),
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
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: IconButton(
                  onPressed: () {  },
                  icon: Icon(Icons.search,
                  size: 35.0,
                  ),

                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 120.0 ),
                //   child: Text(
                //     'Chat App',
                //     style: TextStyle(
                //       fontSize: 25.0,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white,
                //     ),
                //     textAlign: TextAlign.center,
                //   ),
                // ),




              ],
            ),
          ),
        ),
      ],
    );
  }
}
