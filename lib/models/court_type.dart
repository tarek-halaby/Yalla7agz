class CourtType {
  String id;
  String _type;
  String _maxPlayers;

  CourtType( this._type, this._maxPlayers,{this.id});

  String get maxPlayers => _maxPlayers;

  set maxPlayers(String value) {
    _maxPlayers = value;
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

}
