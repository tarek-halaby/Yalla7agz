import 'package:Yalla7agz/providers/users.dart';
import 'package:Yalla7agz/widgets/loading_indicator.dart';
import 'package:Yalla7agz/widgets/message_widget.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class editProfile extends StatefulWidget {
  editProfile({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  final _editProfileFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    mobileController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final loadedUser = Provider.of<Users>(
      context,
      listen: false,
    ).user;
    nameController.text=loadedUser.getName();
    mobileController.text=loadedUser.getMobileNumber();
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
                          "Edit Profile",
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
                              "Name: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.red),
                            ),
                          ),

                        Container(
                          width:_width*0.87,
                          child: TextFormField(

                            textInputAction: TextInputAction.next,
                            controller: nameController,
                            inputFormatters: [
                              new FilteringTextInputFormatter.allow(
                                  RegExp("[a-zA-Z ]"))
                            ],
                            validator: (value) {
                              if (value.isEmpty) {
                                return "* Please enter your Name";
                              } else if (value.length < 2) {
                                return "* Please enter valid Name";
                              }
                              return null;
                            },
                            decoration: new InputDecoration(
                              hintText: 'Your name',
                            ),
                            autofocus: false,
                          ),
                        ),

                      SizedBox(
                        height: _height * 0.025,
                      ),
                  new Container(
                    width: _width * 0.87,
                    alignment: Alignment.centerLeft,
                            child: Text(
                              "Mobile: ",
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
                              keyboardType: TextInputType.number,
                              controller: mobileController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "* Please enter your mobile number";
                                } else if (value.length != 11) {
                                  return "* Please enter valid mobile number";
                                }
                                return null;
                              },
                              decoration: new InputDecoration(
                                hintText: 'Your mobile number',
                              ),
                              autofocus: false,
                            )),
                      SizedBox(
                        height: _height * 0.025,
                      ),
                      new Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                      InkWell(
                          onTap: () async{
                            if (_editProfileFormKey.currentState.validate()) {
                              DialogBuilder(context).showLoadingIndicator('Loading');
                              await Provider.of<Users>(context, listen: false)
                                  .updateProfile(
                                nameController.text,
                                mobileController.text,
                              ).whenComplete(() async{
                                await Provider.of<Users>(context,listen: false).getUser();
                                DialogBuilder(context).hideOpenDialog();
                                Navigator.pop(context);
                              }).catchError((error) {
                                var errorMessage = 'Update Failed';
                                MessageBoxModal(context).showMessageBoxModal(errorMessage);
                              });
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
