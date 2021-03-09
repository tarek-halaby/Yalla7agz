import 'package:Yalla7agz/models/http_exception.dart';
import 'package:Yalla7agz/providers/auth.dart';
import 'package:Yalla7agz/widgets/loading_indicator.dart';
import 'package:Yalla7agz/widgets/message_widget.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class changePassword extends StatefulWidget {
  changePassword({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  final _editProfileFormKey = GlobalKey<FormState>();

  final oldPassowrdController = TextEditingController();
  final newPassowrdController = TextEditingController();
  final confirmPassowrdController = TextEditingController();
  final FocusNode _oldPasswordFocus = FocusNode();
  final FocusNode _newPasswordFocus = FocusNode();
  final FocusNode _confirmPassowrdFocus = FocusNode();
  bool _oldPasswordVisible;
  bool _newPasswordVisible;
  bool _confirmPasswordVisible;
  @override
  void dispose() {
    super.dispose();

    oldPassowrdController.dispose();
    newPassowrdController.dispose();
    confirmPassowrdController.dispose();
    _oldPasswordFocus.dispose();
    _newPasswordFocus.dispose();
    _confirmPassowrdFocus.dispose();
  }
  @override
  void initState() {
    _oldPasswordVisible = true;
    _newPasswordVisible = true;
    _confirmPasswordVisible = true;
  }
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: Container(),
            centerTitle: true,
            title: Center(
                child: Text("Yalla 7agz",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25))),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]),
        body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child:SingleChildScrollView(

                child:Center(
                    child: Form(
                        key: _editProfileFormKey,
                        child: Container(
                            width: _width * 0.87,
                            margin: EdgeInsets.only(
                                top: _height * 0.04, bottom: _height * 0.02),
                            child: Column(children: <Widget>[
                              new Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Change Password",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Color(0xFF71A411),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: _height * 0.025,
                              ),
                              CustomPaint(
                                size: Size(_width * 0.87, _height * 0.006),
                                painter: CurvePainter(
                                    Color(0xFF71A411), Color(0x2671A411), 3),
                              ),
                              SizedBox(
                                height: _height * 0.025,
                              ),
                          new Container(
                            width: _width * 0.87,
                            alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Old Password: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.red),
                                    ),
                                  ),
                                Container(
                                  width: _width*0.87,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    focusNode: _oldPasswordFocus,
                                    onFieldSubmitted: (term){
                                      _oldPasswordFocus.unfocus();
                                      FocusScope.of(context).requestFocus(_newPasswordFocus);
                                    },
                                    controller: oldPassowrdController,
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
                                          _oldPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,

                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _oldPasswordVisible =
                                            !_oldPasswordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    autofocus: false,
                                    obscureText: _oldPasswordVisible,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                  ),
                                ),
                              SizedBox(
                                height: _height * 0.025,
                              ),
                              new Container(
                              width: _width * 0.87,
                                alignment: Alignment.centerLeft,
                                    child: Text(
                                      "New Password: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.red),
                                    ),
                                  ),
                                Container(
                                  width: _width * 0.87,

                                  child: TextFormField(
                                      textInputAction: TextInputAction.next,
                                      focusNode: _newPasswordFocus,
                                      onFieldSubmitted: (term){
                                        _newPasswordFocus.unfocus();
                                        FocusScope.of(context).requestFocus(_confirmPassowrdFocus);
                                      },
                                      controller: newPassowrdController,
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
                                            _newPasswordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,

                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _newPasswordVisible =
                                              !_newPasswordVisible;
                                            });
                                          },
                                        ),
                                      ),
                                      autofocus: false,
                                      obscureText: _newPasswordVisible,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                    ),
                                ),
                              SizedBox(
                                height: _height * 0.025,
                              ),
                                Container(
                                  child: Container(
                                    width: _width * 0.87,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Confirm Password: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.red),
                                    ),
                                  ),
                                ),
                              Container(
                                width: _width * 0.87,

                                child: TextFormField(
                                      textInputAction: TextInputAction.done,
                                      controller: confirmPassowrdController,
                                      focusNode: _confirmPassowrdFocus,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "* Please enter your confirm your password";
                                        }
                                        else if(value!=newPassowrdController.text)
                                        {
                                          return "* Password doesn't match";
                                        }
                                        return null;
                                      },
                                      decoration: new InputDecoration(
                                        hintText: 'Confirm Password',
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _confirmPasswordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,

                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _confirmPasswordVisible =
                                              !_confirmPasswordVisible;
                                            });
                                          },
                                        ),
                                      ),
                                      autofocus: false,
                                      obscureText: _confirmPasswordVisible,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                    ),
                                ),
                              SizedBox(
                                height: _height * 0.025,
                              ),
                              new Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              InkWell(
                                  onTap: ()async {
                                    if (_editProfileFormKey.currentState.validate()) {
                                      try {
                                        DialogBuilder(context).showLoadingIndicator('Loading');
                                        await Provider.of<Auth>(context, listen: false).changePassword(
                                            oldPassowrdController.text,
                                          newPassowrdController.text
                                        ).whenComplete(() {
                                          DialogBuilder(context).hideOpenDialog();});
                                        Navigator.pop(context);
                                      } on HttpException catch (error) {
                                        var errorMessage = error.toString();
                                        if (error.toString().contains('EMAIL_NOT_FOUND')) {
                                          errorMessage = 'This email address is not found.';
                                        }
                                        MessageBoxModal(context).showMessageBoxModal(errorMessage);
                                      }
                                    }
                                  },
                                  child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                      child: Center(
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))),
                              new Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ))),
                              new Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                            ])))))));
  }
}
