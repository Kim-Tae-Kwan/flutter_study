import 'package:firebase/memo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MemoAddPage extends StatefulWidget {
  final DatabaseReference reference;

  const MemoAddPage(this.reference, {super.key});

  @override
  State<MemoAddPage> createState() => _MemoAddPageState();
}

class _MemoAddPageState extends State<MemoAddPage> {
  late TextEditingController titleController;
  late TextEditingController contentController;


  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Memo Add'),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: '제목',
                  fillColor: Colors.blueAccent
                ),
              ),
              Expanded(
                child: TextField(
                  controller: contentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 100,
                  decoration: const InputDecoration(labelText: '내용'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Memo memo = Memo(
                    titleController.value.text,
                    contentController.value.text,
                    DateTime.now().toIso8601String()
                  );

                  widget.reference.push().set(memo.toJson()).then((_) {
                    Navigator.of(context).pop();
                  });
                },
                child: Text('저장하기', style: TextStyle(
                  color: Colors.white
                )),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
