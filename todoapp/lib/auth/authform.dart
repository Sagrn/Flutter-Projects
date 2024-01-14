import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  //---------------------------------------
  final _formkey = GlobalKey<FormState>();
  var _email = "";
  var _password ="";
  var _username = "";
 bool isLoginPage = false;
  //----------------------------------------

  startauthentication() async {
    final validity = _formkey.currentState?.validate();
    FocusScope.of(context).unfocus();

    if(validity!){
      _formkey.currentState?.save();
      submitForm();
    }
  }

  submitForm (String email,String password,String username) async {
    final auth = FirebaseAuth.instance;
    Firebase authResult;
    try{
      if(isLoginPage){

      }
    }
  }
  //----------------------------------------

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10,right: 10,top: 20),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  if(isLoginPage)
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key: ValueKey('username'),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Username not be empty";
                      }
                      return null;
                    },
                    onSaved: (value){
                      _username = value!;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(8),
                            borderSide:  BorderSide()
                        ),
                        labelText: "Enter Username",
                        labelStyle: GoogleFonts.roboto()
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key: ValueKey('email'),
                    validator: (value){
                      if(value!.isEmpty || !value.contains("@")){
                        return "Incorrect Email";
                      }
                      return null;
                    },
                    onSaved: (value){
                      _email = value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(8),
                        borderSide:  BorderSide()
                      ),
                      labelText: "Enter Email",
                      labelStyle: GoogleFonts.roboto()
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key: ValueKey('password'),
                    validator: (value){
                      if(value!.isEmpty ){
                        return "Incorrect Pasword";
                      }
                      return null;
                    },
                    onSaved: (value){
                      _password = value!;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(8),
                            borderSide:  BorderSide()
                        ),
                        labelText: "Enter Password",
                        labelStyle: GoogleFonts.roboto()
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton(
                      onPressed: (){},
                      child: isLoginPage? Text("SignUp",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54),)
                          : Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: (){
                            setState(() {
                              isLoginPage  = !isLoginPage;
                            });
                      },
                      child: isLoginPage? Text("already a user .. click here",style: TextStyle(fontSize: 16)) :
                      Text("Not a User ? .. click here",style: TextStyle(fontSize: 16),)

                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

