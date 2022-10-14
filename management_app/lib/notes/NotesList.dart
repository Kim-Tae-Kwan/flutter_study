import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:management_app/notes/NotesDBWorker.dart';
import 'package:management_app/notes/NotesModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'NotesModel.dart' show Note, NotesModel, notesModel;

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<NotesModel>(
      model: notesModel,
      child: ScopedModelDescendant<NotesModel>(
        builder: (context, child, model) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                notesModel.entityBeingEdited = Note();
                notesModel.setColor(null);
                notesModel.setStackIndex(1);
              },
            ),
            body: ListView.builder(
              itemCount: notesModel.entityList.length,
              itemBuilder: (context, index) {
                Note note = notesModel.entityList[index];
                Color color = Colors.white;
                switch (note.color) {
                  case "red":
                    color = Colors.red;
                    break;
                  case "green":
                    color = Colors.green;
                    break;
                  case "blue":
                    color = Colors.blue;
                    break;
                  case "yellow":
                    color = Colors.yellow;
                    break;
                  case "grey":
                    color = Colors.grey;
                    break;
                  case "purple":
                    color = Colors.purple;
                    break;
                }

                return Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Slidable(
                    // delegate: const SlidableDrawerDelegate(),
                    // actionExtentRatio: 0.25,
                    // secondaryActions: [
                    //   IconSlideAction(
                    //     caption: 'Delete',
                    //     color: Colors.red,
                    //     icon: Icons.delete,
                    //     onTap: () => _deleteNote(context, note),
                    //   )
                    // ],
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => _deleteNote(context, note),
                          label: 'Delete',
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ],
                    ),
                    child: Card(
                      elevation: 8,
                      color: color,
                      child: ListTile(
                        title: Text('${note.title}'),
                        subtitle: Text('${note.content}'),
                        onTap: () async {
                          notesModel.entityBeingEdited =
                              await NotesDBWorker.db.get(note.id!);
                          notesModel
                              .setColor(notesModel.entityBeingEdited.color);
                          notesModel.setStackIndex(1);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future _deleteNote(BuildContext context, Note note) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (inAlertContext) {
        return AlertDialog(
          title: const Text('Delete Note'),
          content: Text('Are you sure you want to delete ${note.title}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(inAlertContext).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await NotesDBWorker.db.delete(note.id!);
                Navigator.of(inAlertContext).pop();
                Scaffold.of(context).showBottomSheet((context) {
                  return SnackBar(
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 2),
                    content: Text('Note deleted'),
                  );
                });
                notesModel.loadData('notes', NotesDBWorker.db);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
