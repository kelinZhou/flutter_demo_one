class Hospital {
  final Map<String, Object> _inner;

  Hospital(this._inner);

  String get imageUrl {
    return _inner['thumb_cover'];
  }

  String get name {
    return _inner['name'];
  }

  String get address {
    return _inner['address'];
  }

  String get reputation {
    return _inner['reputation'];
  }

  String get reviewsCount {
    return "${_inner['reviews_count']}评论";
  }

  bool get appointmentCovered {
    return _inner['appointment_covered'];
  }
  
  bool get isFavorite{
    return _inner['is_favorite']??false;
  }
  
  set isFavorite(bool favorite){
    _inner['is_favorite'] = favorite;
  }
}
