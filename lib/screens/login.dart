import 'package:Yalla7agz/models/user.dart';
import 'package:Yalla7agz/widgets/message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/screens/signup.dart';
import 'package:Yalla7agz/providers/auth.dart';
import 'package:Yalla7agz/widgets/loading_indicator.dart';
import 'package:Yalla7agz/widgets/loading_indicator.dart';
import 'package:Yalla7agz/models/http_exception.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginStatefulWidget();
  }
}

class LoginStatefulWidget extends StatefulWidget {
  LoginStatefulWidget({Key key}) : super(key: key);

  @override
  LoginStatefulWidgetState createState() => LoginStatefulWidgetState();
}

class LoginStatefulWidgetState extends State<LoginStatefulWidget> {
  bool _passwordVisible;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: "client@miu.com");
  final passowrdController = TextEditingController(text: "12345678");
  var _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passowrdController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: GestureDetector(onTap: () {
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }, child: Builder(builder: (BuildContext context) {
      return Container(
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
            new Container(
              margin:
                  EdgeInsets.only(top: _height * 0.06, bottom: _height * 0.01),
              child: Center(
                  child: Icon(
                FontAwesomeIcons.futbol,
                size: _width * 0.25,
                color: Color(0xFF71A411),
              )),
            ),
            new Container(
                margin: EdgeInsets.only(
                    top: _height * 0.01, bottom: _height * 0.01),
                child: Center(
                    child: Text(
                  "Yalla 7agz",
                  style: TextStyle(color: Color(0xFF71A411), fontSize: 25),
                ))),
            new Container(
                width: _width * 0.8,
                margin: EdgeInsets.only(top: _height * 0.05),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      new Container(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: _height * 0.01),
                      new Container(
                        child: Text(
                          "Hi there! Nice to see you again.",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(height: _height * 0.025),
                      new Container(
                        child: Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.red),
                        ),
                      ),
                      new Container(
                          child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "* Please enter your Email";
                          } else if (!EmailValidator.validate(value)) {
                            return "* Please enter a valid Email";
                          }
                          return null;
                        },
                        decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Enter Email Here',
                        ),
                        autofocus: false,
                      )),
                      SizedBox(height: _height * 0.015),
                      new Container(
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.red),
                        ),
                      ),
                      new Container(
                          child: TextFormField(
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) async {
                          await submitForm();
                        },
                        controller: passowrdController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "* Please enter your Password";
                          } else if (value.length < 5) {
                            return "* Password must contain at least 5 characters";
                          }
                          return null;
                        },
                        decoration: new InputDecoration(
                          hintText: 'Enter Password Here',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        autofocus: false,
                        obscureText: _passwordVisible,
                        enableSuggestions: false,
                        autocorrect: false,
                      )),
                      SizedBox(height: _height * 0.02),
                      new Container(
                        alignment: Alignment.centerRight,
                        child: Text.rich(TextSpan(
                            children: <InlineSpan>[TextSpan(
                            text: "Forgot Password?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, '/forgotPassword');
                              })
                        ]))),
                      SizedBox(height: _height * 0.05),
                      new Container(
                          width: _width * 0.8,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                new Container(
                                    height: _height * 0.07,
                                    child: RaisedButton(
                                      onPressed: () async => submitForm(),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          side: BorderSide(
                                              color: Color(0xFF71A411))),
                                      color: Color(0xFF71A411),
                                      child: Text(
                                        "Log In",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )),
                                SizedBox(height: _height * 0.025),
                                new Container(
                                  margin:
                                      EdgeInsets.only(bottom: _height * 0.03),
                                  child: Center(
                                      child: Text.rich(TextSpan(
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: "Don't have an account? ",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      TextSpan(
                                          text: "Register",
                                          style: TextStyle(
                                              color: Color(0xFF71A411),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          recognizer: new TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushNamed(
                                                  context, '/signUp');
                                            })
                                    ],
                                  ))),
                                ),
                              ]))
                    ],
                  ),
                ))
          ])));
    })));
  }

  submitForm() async {
    if (_formKey.currentState.validate()) {
      DialogBuilder(context).showLoadingIndicator('Loading');
      await Provider.of<Auth>(context, listen: false)
          .login(
        emailController.text,
        passowrdController.text,
      ).whenComplete(() {
        DialogBuilder(context).hideOpenDialog();
      }).catchError((error) {
        var errorMessage = 'Authentication failed';
        if (error.toString().contains('EMAIL_EXISTS')) {
          errorMessage = 'This email address is already in use.';
        } else if (error.toString().contains('INVALID_EMAIL')) {
          errorMessage = 'This is not a valid email address';
        } else if (error.toString().contains('WEAK_PASSWORD')) {
          errorMessage = 'This password is too weak.';
        } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
          errorMessage = 'Could not find a user with that email.';
        } else if (error.toString().contains('INVALID_PASSWORD')) {
          errorMessage = 'Invalid password.';
        }
        MessageBoxModal(context).showMessageBoxModal(errorMessage);
      });
    }
  }
}
