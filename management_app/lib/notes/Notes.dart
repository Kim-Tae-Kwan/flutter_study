import 'package:flutter/material.dart';
import 'package:management_app/notes/NotesEntry.dart';
import 'package:management_app/notes/NotesList.dart';
import 'package:management_app/notes/NotesModel.dart';
import 'package:scoped_model/scoped_model.dart';

class Notes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<NotesModel>(
      model: notesModel,
      child: ScopedModelDescendant<NotesModel>(
        builder: (context, child, model) {
          return IndexedStack(
            index: model.stackIndex,
            children: [
              NotesList(),
              NotesEntry()
            ],
          );
        },
      ),
    );
  }
}
