class Tour {
  String? title;
  String? tel;
  String? zipcode;
  String? address;
  String? id;
  String? mapx;
  String? mapy;
  String? imagePath;

  Tour({this.title, this.tel, this.zipcode, this.address, this.id, this.mapx,
      this.mapy, this.imagePath});

  Tour.fromJson(Map json){
    id = json['contentid'];
    title = json['title'];
    tel = json['tel'];
    zipcode = json['zipcode'];
    address = json['addr1'];
    mapx = json['mapx'];
    mapy = json['mapy'];
    imagePath = json['firstimage'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'title' : id,
      'tel' : id,
      'zipcode' : id,
      'address`' : id,
      'mapx' : id,
      'mapy' : id,
      'imagePath' : imagePath
    };
  }

}