
import 'package:chat_app/addRoom/add_room_navigator.dart';
import 'package:chat_app/addRoom/add_room_view_model.dart';
import 'package:chat_app/addRoom/drop_list_model.dart';
import 'package:chat_app/addRoom/file%20select_drop_list.dart';
import 'package:chat_app/screens/chat_app/chat_app.dart';
import 'package:chat_app/shared/base.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRoomScreen extends StatefulWidget {
  static const String routeName = 'addRoomScreen';

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends BaseView<AddRoomScreen, AddRoomViewModel>
    implements AddRoomNavigator {
  DropListModel dropListModel = DropListModel([OptionItem(id: "1", title: "Sports"), OptionItem(id: "2", title: "Music") , OptionItem(id: "3", title: "Movies")]);
  OptionItem optionItemSelected = OptionItem(id: "null", title: "Select Room Category");

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var nameRoom = TextEditingController();
  var describRoom = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => viewModel,
        child: Stack(children: [
          Image.asset(
            'assets/images/SIGN UP - PERSONAL.png',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Padding(
                  padding: const EdgeInsets.only(left: 80.0, top: 30.0),
                  child: Text(
                    'Chat App',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              body: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Card(
                      elevation: 20.0,

                      child: Container(
                        height: 450.0,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Form(
                              key: formkey,
                              child: Column(children: [
                                Text('Create New Room',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Image.asset('assets/images/Item.png',
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                    controller: nameRoom,
                                    validator: (value) {
                                      if (value == null || value.trim() == '') {
                                        return ('Please Enter Room Title');
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Enter Room Title',
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 10.0,
                                ),
                                SelectDropList(
                                  this.optionItemSelected,
                                  this.dropListModel,
                                      (optionItem){
                                    optionItemSelected = optionItem;
                                    setState(() {

                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  maxLines: 3,
                                    controller: describRoom,
                                    validator: (value) {
                                      if (value == null || value.trim() == '') {
                                        return ('Please Enter Room Description');
                                      }
                                      return null;
                                    },
                                    // textInputAction: TextInputAction.next,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Enter Room Description',
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      // width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          GoToNextScreen(context);
                                        },
                                        child: Row(
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Center(
                                              child: Text(
                                                'Create',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 80.0,
                                            ),
                                            // Icon(
                                            //   Icons.forward,
                                            //   size: 30.0,
                                            // ),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color.fromRGBO(53, 152, 219, 1.0),
                                          // background
                                          onPrimary: Colors.white, // foreground
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]))),
          ),
        ]));
  }

  void GoToNextScreen(BuildContext context) {
    if (formkey.currentState!.validate()) {
      Navigator.pop(context);
      viewModel.AddRoomsToDB(nameRoom.text, describRoom.text,optionItemSelected.id);


    }
  }

  @override
  AddRoomViewModel initViewModel() {
    return AddRoomViewModel();
  }


}
