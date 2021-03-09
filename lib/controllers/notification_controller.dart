import 'package:Yalla7agz/models/notification.dart';

final List<notification> notifications=[notification(title:"Acceptance",messege:"el wafaa wel amal has accepted your request for the court number 1",isSeen:false),notification(title:"Acceptance",messege:"el wafaa wel amal has accepted your request for the court number 2",isSeen:false),notification(title:"Acceptance",messege:"el wafaa wel amal has accepted your request for the court number 3",isSeen:false),
  notification(title:"Acceptance",messege:"el wafaa wel amal has accepted your request for the court number 4",isSeen:true),notification(title:"Acceptance",messege:"el wafaa wel amal has accepted your request for the court number 5",isSeen:true),notification(title:"Acceptance",messege:"el wafaa wel amal has accepted your request for the court number 6",isSeen:true),
  notification(title:"Acceptance",messege:"el wafaa wel amal has accepted your request for the court number 7",isSeen:true),notification(title:"Acceptance",messege:"el wafaa wel amal has accepted your request for the court number 8",isSeen:true),notification(title:"Acceptance",messege:"el wafaa wel amal has accepted your request for the court number 9",isSeen:true),];
class notificationController{
  bool areAllSeen()
  {
    for(final not in notifications)
    {
     if(!not.getSeen())
    {
      return false;
    }
    }
  }
  void allSeen()
  {
    for(final not in notifications)
    {
      not.setSeen(true);
    }
  }
}