class User {
  int _id;
  String _email;
  String _password;
  String _mobileNumber;
  String _firstName;
  String _lastName;
  User(id,email,password,fname,lname,mobilePhone)
  {
    _id=id;
    _email=email;
    _password=password;
    _firstName=fname;
    _lastName=lname;
    _mobileNumber=mobilePhone;
  }
  String getName()
  {
    return _firstName+_lastName;
  }
  String getEmail()
  {
    return _email;
  }
  String getPassword()
  {
    return _password;
  }
  String getMobileNumber()
  {
    return _mobileNumber;
  }
}