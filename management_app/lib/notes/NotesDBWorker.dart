import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:management_app/utils.dart' as utils;
import 'NotesModel.dart';

class NotesDBWorker {
  static final NotesDBWorker db = NotesDBWorker._();
  Database? _db;

  NotesDBWorker._();

  Future get database async {
    _db ??= await init();
    return _db;
  }

  Future<Database> init() async {
    String path = join(utils.docsDir!.path, 'notes.db');
    Database db = await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE IF NOT EXISTS notes ("
            "id INTEGER PRIMARY KEY,"
            "title TEXT,"
            "content TEXT,"
            "color TEXT"
            ")");
      },
    );

    return db;
  }



  Future<int> create(Note note) async {
    Database db = await database;

    // 최신 id 조회.
    List<Map<String, dynamic>> val =
        await db.rawQuery("SELECT MAX(id) + 1 AS id FROM notes");
    int id = val.first["id"];
    id ??= 1;

    // note 생성.
    return await db.rawInsert(
        "INSERT INTO notes (id, title, content, color) VALUES (?,?,?,?)",
        [id, note.title, note.content, note.color]);
  }

  Future<Note> get(int inID) async {
    Database db = await database;
    List<Map<String, Object?>> rec =
        await db.query('notes', where: 'id=?', whereArgs: [inID]);

    return Note.fromMap(rec.first);
  }

  Future<List<Note>> getAll() async {
    Database db = await database;
    List<Map<String, Object?>> recs = await db.query('notes');
    List<Note> list =
        recs.isNotEmpty ? recs.map((rec) => Note.fromMap(rec)).toList() : [];
    return list;
  }

  Future<int> update(Note note) async {
    Database db = await database;
    return db.update('notes', note.toMap(), where: "id=?", whereArgs: [note.id]);
  }

  Future<int> delete(int id) async {
    Database db = await database;
    return db.delete('notes', where: 'id=?', whereArgs: [id]);
  }
}
