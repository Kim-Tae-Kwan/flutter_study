import 'package:flutter/material.dart';
import 'package:management_app/notes/NotesDBWorker.dart';
import 'package:management_app/notes/NotesModel.dart';
import 'package:scoped_model/scoped_model.dart';

class NotesEntry extends StatelessWidget {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _contentEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  NotesEntry({super.key}) {
    _titleEditingController.addListener(() {
      notesModel.entityBeingEdited.title = _titleEditingController.text;
    });
    _contentEditingController.addListener(() {
      notesModel.entityBeingEdited.content = _titleEditingController.text;
    });
  }


  @override
  Widget build(BuildContext context) {
    _titleEditingController.text = notesModel.entityBeingEdited.title;
    _contentEditingController.text = notesModel.entityBeingEdited.content;

    return ScopedModel(
      model: notesModel,
      child: ScopedModelDescendant<NotesModel>(
        builder: (context, child, model) {
          return Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Row(
                children: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      model.setStackIndex(0);
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    child: const Text('Save'),
                    onPressed: () {
                      _save(context, notesModel);
                    },
                  )
                ],
              ),
            ),
            body: Form(
              key: _formKey,
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.title),
                    title: TextFormField(
                      decoration: const InputDecoration(hintText: 'Title'),
                      controller: _titleEditingController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.content_paste),
                    title: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      decoration: InputDecoration(hintText: 'Content'),
                      controller: _contentEditingController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Please enter content';
                        }
                        return null;
                      },
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.color_lens),
                    title: Row(
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: Border.all(width: 18, color: Colors.red) +
                                Border.all(
                                  width: 6,
                                  color: notesModel.color == 'red' ? Colors.red : Theme.of(context).canvasColor
                                )
                            ),
                          ),
                          onTap: () {
                            notesModel.entityBeingEdited.color = 'red';
                            notesModel.setColor('red');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _save(BuildContext context, NotesModel model) async{
    if(!_formKey.currentState!.validate()) {return;}

    if(model.entityBeingEdited.id == null){
      await NotesDBWorker.db.create(
        notesModel.entityBeingEdited
      );
    }else{
      await NotesDBWorker.db.update(
        notesModel.entityBeingEdited
      );
    }

    notesModel.loadData('notes', NotesDBWorker.db);
    model.setStackIndex(0);

    Scaffold.of(context).showBottomSheet((context) {
      return const SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        content: Text('Note Saved '),
      );
    });
  }
}
