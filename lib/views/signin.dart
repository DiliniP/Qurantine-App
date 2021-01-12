import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp2/services/auth.dart';
import 'package:quizapp2/views/home.dart';
import 'package:quizapp2/views/signup.dart';
import 'package:quizapp2/widget/widget.dart';

class SignIn extends StatefulWidget {
  final Function toogleView;

  SignIn({this.toogleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading =false;

  final _formKey = GlobalKey<FormState>();
  String email, password;
  final AuthService authService = new AuthService();
  // final AuthService _authService = AuthService();

  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();



  signIn() async{
    if(_formKey.currentState.validate()){
      setState(() {
        isLoading = true;

      });
        await authService.signInEmailAndPass(email, password).then((value) {
          if( value !=null){
        setState(() {
          isLoading = false;

        });

          }
        });
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()
        ));

    }
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppLogo(),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        //brightness: Brightness.li,
      ),
      body: isLoading ? Container(
        child: CircularProgressIndicator(),
      ) : Form(
key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter valid email " : null;
                },
                decoration: InputDecoration(hintText: "Email"),
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter valid password " : null;
                },
                decoration: InputDecoration(hintText: "Password"),
                onChanged: (val) {
                  email = val;
                },
                obscureText: true,
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: (){
                  signIn();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30)),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 48,
                  child: Text(
                    "Sign in ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't you have an account? "),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUp()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 15.5,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
