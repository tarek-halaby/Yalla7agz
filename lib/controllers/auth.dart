import 'package:Yalla7agz/models/user.dart';
var users=[User(0,'admin@miu.com','admin','Ahmed','Mohamed','01158963214',false),
  User(1,'ADMIN@miu.com','ADMIN','khaled','loay','01158467514',false),
  User(2,'client@miu.com','client','omar','ahmed','01178546854',true),
  User(3,'CLIENT@miu.com','CLIENT','emad','waleed','01023548656',true),
];
class Auth
{
  String _email;
  String _password;
  Auth(username,password)
  {
    _email=username;
    _password=password;
  }
  Auth.sigingUp(){}
  int login()
  {
   for(var element in users)
     {
      if(element.getEmail()==_email&&element.getPassword()==_password)
        {
          if(element.getIsClient())
            {
              return 1;
            }
          else
            {
              return 2;
            }
        }
      };
   return null;
  }
  String signup(email,password,name,mobilePhone)
  {
    for(var element in users)
    {
      if(element.getEmail()==email)
      {
        return 'Email is already in use';
      }
      else if(element.getMobileNumber()==mobilePhone)
        {
          return 'Mobile Number is already in use';
        }
    };
    users.add(User(4,email,password,name,'lname',mobilePhone,true));
    print(email);
    print(password);
    return null;
  }

}