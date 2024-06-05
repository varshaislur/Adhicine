

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:umla_assignment_app/screens/home_page.dart';
import 'package:umla_assignment_app/screens/signup_page.dart';
import 'package:umla_assignment_app/widgets/textfield_auth_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:umla_assignment_app/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();
  final AuthServices authServices = AuthServices();






  @override
  Widget build(BuildContext context) {
    void ErrorMessage(String errormessage) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (context) {
          return AlertDialog(
            title: Text(errormessage),
            // content: const SingleChildScrollView(
            //   child: ListBody(
            //     children: <Widget>[
            //       Text('This is a demo alert dialog.'),
            //       Text('Would you like to approve of this message?'),
            //     ],
            //   ),
            // ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    void handleSignin() async{
      //loading indicator
      showDialog(context: context, builder: (context){
        return Center(child:CircularProgressIndicator(),
        );
      });
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailcontroller.text.trim(),
            password: passwordcontroller.text.trim());
        //pop loading
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
      } on FirebaseException catch(e){
        //pop loading
        Navigator.pop(context);
        ErrorMessage(e.message!);
      }
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Umla"
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Text("Sign In",
              style: TextStyle(
                color: Color.fromRGBO(49, 39, 79, 1),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
          ),
          CustomTextField(icon: Icons.email,controller:emailcontroller, isobscure: false,name:"email"),
          CustomTextField(icon: Icons.lock,controller:passwordcontroller, isobscure: true,name:"password"),
          GestureDetector(
        onTap: () {
          handleSignin();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
            color: Colors.cyan),
            height: 45,
            width:MediaQuery.sizeOf(context).width,
            
            child: Center(child: Text("Sign In",style:TextStyle(
              color: Colors.white,
              fontSize: 20
            )),),),
        )
    ),
          Divider(),
           ElevatedButton(
                
                onPressed: () {
                  authServices.signInWithGoogle(context: context);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage("assets/images/google_logo.jpg"),
                        height: 18.0,
                        width: 24,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24, right: 8),
                        child: Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 40),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?" ,style:TextStyle(
                      fontSize: 18
                  )),
                  GestureDetector(child: Text("Sign Up",style: TextStyle(
                      color:Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18

                  ),), onTap:(){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
