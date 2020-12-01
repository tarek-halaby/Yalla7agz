class User {
  int _id;
  String _email;
  String _password;
  String _mobileNumber;
  String _firstName;
  String _lastName;
  bool _isClient;
  User(id,email,password,fname,lname,mobilePhone,isClient)
  {
    _isClient=isClient;
    id=_id;
    _email=email;
    _password=password;
    _firstName=fname;
    _lastName=lname;
    _mobileNumber=mobilePhone;
  }
  bool getIsClient()
  {
    return _isClient;
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