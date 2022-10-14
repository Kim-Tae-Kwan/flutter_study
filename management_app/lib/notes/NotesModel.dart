import 'package:management_app/BaseModel.dart';

class Note {
  int? id;
  String? title;
  String? content;
  String? color; // 화면에 보여지는 card 색상.

  Note({this.id, this.title, this.content, this.color});

  Note.fromMap(Map<String, dynamic> inMap) {
    id = inMap["id"];
    title = inMap["title"];
    content = inMap["content"];
    color = inMap["color"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map["id"] = id;
    map["id"] = title;
    map["id"] = content;
    map["id"] = color;
    return map;
  }

  @override
  String toString(){
    return "{ id=$id, title=$title, "
        "content=$content, color=$color }";
  }

}

class NotesModel extends BaseModel{
  String? color;

  void setColor(String? inColor){
    color = inColor;
    notifyListeners();
  }
}

NotesModel notesModel = NotesModel();