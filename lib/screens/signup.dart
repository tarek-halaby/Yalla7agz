import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Yalla7agz/screens/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:Yalla7agz/auth.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpStatefulWidget();
  }
}

class SignUpStatefulWidget extends StatefulWidget {
  SignUpStatefulWidget({Key key}) : super(key: key);

  @override
  SignUpStatefulWidgetState createState() => SignUpStatefulWidgetState();
}
class SignUpStatefulWidgetState extends State<SignUpStatefulWidget> {
  bool _passwordVisible;
  bool _passwordVisible2;
  final _signupFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passowrdController = TextEditingController();
  final confirmPassowrdController = TextEditingController();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPassowrdFocus = FocusNode();
  bool acceptTerms = false;
  bool submited = false;
  @override
  void dispose() {
    emailController.dispose();
    passowrdController.dispose();
    confirmPassowrdController.dispose();
    nameController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _passwordVisible = true;
    _passwordVisible2 = true;
  }
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery
        .of(context)
        .size
        .height;
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return  Container(
          child:Form(
            key: _signupFormKey,

                  child: SingleChildScrollView(

                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height:_height * 0.06,),

                                      new Container(
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(height: _height*0.04),
                                      new Container(
                                        width: _width * 0.8,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Name",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.red),
                                        ),
                                      ),
                                      new Container(
                                        width: _width * 0.8,
                                              child:TextFormField(
                                            textInputAction: TextInputAction.next,

                                            controller: nameController,
                                            inputFormatters: [
                                              new FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
                                            ],
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "* Please enter your Name";
                                              }
                                              else if (value.length<2) {
                                                return "* Please enter valid Name";
                                              }
                                              return null;
                                            },
                                            decoration: new InputDecoration(
                                              hintText: 'Your name',
                                            ),
                                            autofocus: false,
                                          )),
                                      SizedBox(height: _height*0.015),
                                      new Container(
                                        width: _width * 0.8,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Mobile Phone",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.red),
                                        ),
                                      ),
                                      new Container(
                                          width: _width * 0.8,

                                          child:TextFormField(
                                            textInputAction: TextInputAction.next,
                                            keyboardType: TextInputType.number,
                                            controller: mobileController,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly
                                            ],
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "* Please enter your mobile number";
                                              }
                                              else if (value.length!=11) {
                                                return "* Please enter valid mobile number";
                                              }
                                              return null;
                                            },
                                            decoration: new InputDecoration(
                                              hintText: 'Your mobile number',
                                            ),
                                            autofocus: false,
                                          )),
                                      SizedBox(height: _height*0.015),
                                      new Container(
                                        width: _width * 0.8,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Email",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.red),
                                        ),
                                      ),
                                      new Container(
                                          width: _width * 0.8,

                                          child:TextFormField(
                                            textInputAction: TextInputAction.next,
                                            controller: emailController,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "* Please enter your Email";
                                              }
                                              else if(!EmailValidator.validate(value))
                                              {
                                                return "* Please enter a valid Email";
                                              }
                                              return null;
                                            },
                                            decoration: new InputDecoration(
                                              hintText: 'Your email address',
                                            ),
                                            autofocus: false,
                                              )),
                                      SizedBox(height: _height*0.015),
                                      new Container(
                                        width: _width * 0.8,
                                        alignment: Alignment.centerLeft,

                                        child: Text(
                                          "Password",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.red),
                                        ),
                                      ),
                                      new Container(
                                          width: _width * 0.8,

                                          child:TextFormField(
                                            textInputAction: TextInputAction.next,
                                            focusNode: _passwordFocus,
                                            onFieldSubmitted: (term){
                                              _passwordFocus.unfocus();
                                              FocusScope.of(context).requestFocus(_confirmPassowrdFocus);
                                            },
                                            controller: passowrdController,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "* Please enter your Password";
                                              }
                                              else if (value.length<5) {
                                                return "* Password must contain at least 5 characters";
                                              }
                                              return null;
                                            },
                                            decoration: new InputDecoration(
                                              hintText: 'Password',
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  _passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,

                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _passwordVisible =
                                                    !_passwordVisible;
                                                  });
                                                },
                                              ),
                                            ),
                                            autofocus: false,
                                            obscureText: _passwordVisible,
                                            enableSuggestions: false,
                                            autocorrect: false,
                                          )),
                                      SizedBox(height: _height*0.01),
                                      new Container(
                                        width: _width * 0.8,

                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Confirm Password",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.red),
                                        ),
                                      ),
                                      new Container(
                                          width: _width * 0.8,

                                          child:TextFormField(
                                            textInputAction: TextInputAction.done,
                                            controller: confirmPassowrdController,
                                            focusNode: _confirmPassowrdFocus,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "* Please enter your Password";
                                              }
                                              else if (value.length<5) {
                                                return "* Password must contain at least 5 characters";
                                              }
                                              else if(value!=passowrdController.text)
                                                {
                                                  return "* Password doesn't match";
                                                }
                                              return null;
                                            },
                                            decoration: new InputDecoration(
                                              hintText: 'Confirm Password',
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  _passwordVisible2
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,

                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _passwordVisible2 =
                                                    !_passwordVisible2;
                                                  });
                                                },
                                              ),
                                            ),
                                            autofocus: false,
                                            obscureText: _passwordVisible2,
                                            enableSuggestions: false,
                                            autocorrect: false,
                                          )),
                                      SizedBox(height: _height*0.01),
                                      new Container(
                                          width: _width * 0.8,
                                        child: CheckboxListTile(
                                          contentPadding: EdgeInsets.all(0),
                                          value: acceptTerms,
                                          onChanged: (val) {
                                            setState(() => acceptTerms = val);
                                                },
                                          subtitle: !acceptTerms && submited
                                              ? Text(
                                            '* Please accept terms and conditions.',

                                            style: TextStyle(color: Colors.red),
                                          )
                                              : null,
                                          title: new RichText(

                                              text: TextSpan(
                                                children:<InlineSpan>[
                                                  TextSpan(
                                                    text: "I agree to the ",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  TextSpan(
                                                      text: "Terms of Services",
                                                      style: TextStyle(
                                                          color: Color(0xFF71A411)),
                                                      recognizer: new TapGestureRecognizer()
                                                        ..onTap = () {
//                                                          Navigator.pop(context);
//                                                          Navigator.push(
//                                                            context,
//                                                            MaterialPageRoute(
//                                                                builder: (
//                                                                    context) =>
//                                                                    Login()),
//                                                          );
                                                        }
                                                  ),
                                                  TextSpan(
                                                    text: " and ",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  TextSpan(
                                                      text: "Privacy Policy",
                                                      style: TextStyle(
                                                          color: Color(0xFF71A411)),
                                                      recognizer: new TapGestureRecognizer()
                                                        ..onTap = () {
//                                                          Navigator.pop(context);
//                                                          Navigator.push(
//                                                            context,
//                                                            MaterialPageRoute(
//                                                                builder: (
//                                                                    context) =>
//                                                                    Login()),
//                                                          );
                                                        }
                                                  ),
                                                ],


                                              )
                                          ),
                                          controlAffinity: ListTileControlAffinity.leading,
                                          activeColor: Color(0xFF71A411),
                                        )
                                      ),
                                      SizedBox(height: _height*0.05),
                                      new Container(
                                          width: _width*0.8,
                                          height:_height*0.07,

                                          child: RaisedButton(
                                            onPressed: () async {
                                              setState(() {
                                                submited=true;
                                              });
                                              if (_signupFormKey.currentState
                                                  .validate()&&acceptTerms) {
                                                Auth auth = new Auth.sigingUp();
                                                String res=auth.signup(emailController.text, passowrdController.text,nameController.text , mobileController.text);
                                                if(res==null)
                                                  {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context)
                                                          =>Login()
                                                      ));
                                                  }
                                                else
                                                  {
                                                    Scaffold .of(context) .showSnackBar(
                                                        SnackBar(content: Text(res)));
                                                  }
                                              }
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(5.0),
                                                side:
                                                BorderSide(color: Color(
                                                    0xFF71A411))),
                                            color: Color(0xFF71A411),
                                            child: Text(
                                              "Register",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            ),
                                          )),
                                      SizedBox(height: _height*0.025),
                                      new Container(
                                        margin: EdgeInsets.only(bottom: _height*0.03),
                                        child: Center(
                                            child: RichText(

                                                text: TextSpan(
                                                    children:<InlineSpan>[
                                                      TextSpan(
                                                          text: "Have an Account? ",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                          fontSize: 15),
                                                      ),
                                                    TextSpan(
                                                        text: "Sign In",
                                                        style: TextStyle(
                                                            color: Color(0xFF71A411),
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold),
                                                        recognizer: new TapGestureRecognizer()
                                                          ..onTap = () {
                                                            Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (
                                                                      context) =>
                                                                      Login()),
                                                            );
                                                          }
                                                    )
                                                    ],


                                                )
                                            )
                                        ),
                                      ),
                                    ]))

                  ),
              );
            }));
  }
}