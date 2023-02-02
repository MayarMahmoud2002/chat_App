import 'package:chat_app/screens/login_screen/login_navigator.dart';
import 'package:chat_app/screens/login_screen/login_view_model.dart';
import 'package:chat_app/shared/base.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class loginView extends StatefulWidget {
  static const routeName = 'loginView';

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends BaseView<loginView, loginViewModel>
    implements loginNavigator {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  var passwordController = TextEditingController();

  var emailController = TextEditingController();



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
                    'Login',
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
                            Form(
                      key: formkey,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 90.0),
                        child: Column(children: [
                          TextFormField(
                            keyboardType:TextInputType.emailAddress ,
                            controller: emailController,
                              validator: (value) {
                                if (value == null || value.trim() == '') {
                                  return ('Enter Your Gmail');
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Gmail',
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
                          TextFormField(
                              controller: passwordController,

                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.trim() == '') {
                                  return ('Enter Your Password');
                                }
                                return null;
                              },
                              // textInputAction: TextInputAction.next,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Password',
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



                        ]),
                      ),
                    ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: ()
                                {

                                  GoToNextScreen(context);

                                },
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                      child: Text('Login',
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
                                  primary: Color.fromRGBO(53, 152, 219, 1.0), // background
                                  onPrimary: Colors.white, // foreground
                                ),
                              ),
                            ),

                          ],
                        ),

                  ]))))
        ]));
  }
  void GoToNextScreen(BuildContext context) {
    viewModel.loginAccountlisteners(emailController.text, passwordController.text);

  }

  @override
  loginViewModel initViewModel() {
    return loginViewModel();
  }
}


