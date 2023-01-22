import 'package:chat_app/screens/chat_app/chat_app.dart';
import 'package:chat_app/screens/create_account/create_account_viewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//view

class accountScreen extends StatelessWidget
{
   static const routeName='accountScreen';
   GlobalKey<FormState> formkey = GlobalKey<FormState>();
   var passwordController = TextEditingController();
   var emailController = TextEditingController();
   //object from view model
   createAccountViewModel viewModel =createAccountViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => viewModel,
      child: Stack(
        children:[
          Image.asset('assets/images/SIGN UP - PERSONAL.png',
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
                  'Create Account',
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
              padding: const EdgeInsets.only(left: 20.0 , right: 20.0,top: 40.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: formkey,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 90.0),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value)
                              {
                                if (value == null || value.trim()=='')
                                {
                                  return ('Please Enter First Name');
                                }
                                return null;

                              },
                                textInputAction: TextInputAction.next,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                                decoration: InputDecoration(
                                  hintText:'First Name',
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
                                )
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(

                                validator: (value)
                              {
                                if (value==null || value.trim()=='')
                                {
                                  return('Please Enter Last Name');

                                }
                                return null;
                              },
                                textInputAction: TextInputAction.next,

                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                                decoration: InputDecoration(
                                  hintText:'Last Name',
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
                                )
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              controller: emailController,

                                validator: (value)
                              {
                                if (value==null || value.trim()=='')
                                {
                                  return ('Please Enter Your Mail');
                                }
                                final bool emailValid =
                                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid)
                                {
                                  return 'Please Enter valid email';
                                }
                                return null;
                              },
                                textInputAction: TextInputAction.next,

                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                                decoration: InputDecoration(
                                  hintText:'Email',
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
                                )
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                                controller: passwordController,

                                validator: (value)
                                {
                                  if (value==null || value.trim()=='')
                                  {
                                    return ('Please Enter Your Mail');
                                  }
                                  return null;

                                },
                                textInputAction: TextInputAction.next,


                                obscureText: true,
                                // obscuringCharacter: '*',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20.0,
                                ),
                                decoration: InputDecoration(
                                  hintText:'Password',
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
                                )
                            ),
                          ],
                        ),
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
                               Text('Create Account',
                                 style: TextStyle(
                                   fontSize: 25.0,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                               SizedBox(
                                 width: 80.0,
                               ),
                               Icon(
                                 Icons.forward,
                                 size: 30.0,
                               ),
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


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void GoToNextScreen(context) async
  {
    if (formkey.currentState!.validate())
    {
      viewModel.createAccountlisteners(emailController.text, passwordController.text);

      // Navigator.pushReplacementNamed(context, ChatApp.routeName);

    }
}}
