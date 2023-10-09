import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:two_ears/apis/api.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
 late String name,email, password;
  bool isLoading=false;
  GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey();
 late ScaffoldMessengerState scaffoldMessenger ;
  var reg=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  TextEditingController _nameController=new TextEditingController();
  TextEditingController _emailController=new TextEditingController();
  TextEditingController _passwordController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      key: _scaffoldKey,
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/background.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Image.asset(
                    "assets/logo.png",
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Registration",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 27,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            controller: _nameController,

                            decoration: InputDecoration(

                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  color: Colors.white70, fontSize: 15),
                            ),
                            onSaved: (val) {
                              name = val!;
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            controller: _emailController,

                            decoration: InputDecoration(

                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Colors.white70, fontSize: 15),
                            ),
                            onSaved: (val) {
                              email = val!;
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            controller: _passwordController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Colors.white70, fontSize: 15),
                            ),
                            onSaved: (val) {
                              password = val!;
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 0),
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: InkWell(
                                  onTap: (){
                                    if(isLoading)
                                    {
                                      return;
                                    }
                                    if(_nameController.text.isEmpty)
                                    {
                                      scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Enter Name")));
                                      return;
                                    }
                                    if(!reg.hasMatch(_emailController.text))
                                    {
                                      scaffoldMessenger.showSnackBar(SnackBar(content:Text("Enter Valid Email")));
                                      return;
                                    }
                                    if(_passwordController.text.isEmpty||_passwordController.text.length<6)
                                    {
                                      scaffoldMessenger.showSnackBar(SnackBar(content:Text("Password should be min 6 characters")));
                                      return;
                                    }
                                    signup(_nameController.text,_emailController.text,_passwordController.text);
                                  },
                                  child: Text(
                                    "CREATE ACCOUNT",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            letterSpacing: 1)),
                                  ),
                                ),
                              ),
                              Positioned(child: (isLoading)?Center(child: Container(height:26,width: 26,child: CircularProgressIndicator(backgroundColor: Colors.green,))):Container(),right: 30,bottom: 0,top: 0,)

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/signin");
                    },
                    child: Text(
                      "Already have an account?",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              decoration: TextDecoration.underline,
                              letterSpacing: 0.5)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  signup(name,email,password) async
  {
    setState(() {
      isLoading=true;
    });
    // print("Calling");

    Map data = {
      'email': email,
      'password': password,
      'first_name': name,
      'last_name': "last_name"
    };
    // print(data.toString());
    final  response= await http.post(
      Uri.parse(REGISTRATION),
      headers: {
        "Accept": "application/json",
        // "Content-Type": "application/x-www-form-urlencoded"
        "Content-Type": "application/json"
      },


      body: jsonEncode(data),
        encoding: Encoding.getByName("utf-8")
    )  ;

    Map<String,dynamic>resposne=jsonDecode(response.body);
    if (response.statusCode == 200) {

      setState(() {
        isLoading=false;
      });
      // if(!resposne['error'])
      //   {
          Map<String,dynamic>user=resposne;
          // print(" User id ${user['id']}");
          savePref(1,user['first_name'],user['email'],user['id'],user['access_token']);
          Navigator.pushReplacementNamed(context, "/success");
        // }else{
        // print(" ${resposne['message']}");
      // }
      scaffoldMessenger.showSnackBar(SnackBar(content:Text("Welcome, ${resposne['first_name']}!")));
    } else {
      scaffoldMessenger.showSnackBar(SnackBar(content:Text("${resposne['message']}")));
      // scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Try again")));
    }

  }

  savePref(int value, String name, String email, String id, String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

      preferences.setInt("value", value);
      preferences.setString("name", name);
      preferences.setString("email", email);
      preferences.setString("id", id.toString());
      preferences.setString("token", token);

      preferences.setInt("voice", 0);
      preferences.setInt("audience", 0);
      // preferences.commit();

  }
}
