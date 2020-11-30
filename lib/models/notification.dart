class notification{
  String _title;
  String _messege;
  bool _isSeen;
  notification({title,messege,isSeen}){
    _title=title;
    _messege=messege;
    _isSeen=isSeen;
  }
  String getTitle()
  {
    return _title;
  }
  String getMessege()
  {
    return _messege;
  }
  bool getSeen()
  {
    return _isSeen;
  }
  setSeen(bool seen)
  {
    _isSeen=seen;
  }
}