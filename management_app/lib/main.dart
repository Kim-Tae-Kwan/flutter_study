import 'dart:io';
import 'package:flutter/material.dart';
import 'package:management_app/appointments/Appointments.dart';
import 'package:management_app/contacts/Contacts.dart';
import 'package:management_app/notes/Notes.dart';
import 'package:management_app/tasks/Tasks.dart';
import 'package:path_provider/path_provider.dart';
import 'utils.dart' as utils;

void main() {
  startMeUp() async {
    Directory docsDir = await getApplicationDocumentsDirectory();
    utils.docsDir = docsDir;

    runApp(ManagementApp());
  }

  startMeUp();
}

class ManagementApp extends StatelessWidget {
  const ManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ManagementApp'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.date_range),
                  text: 'Appointments',
                ),
                Tab(
                  icon: Icon(Icons.contacts),
                  text: 'Contacts',
                ),
                Tab(
                  icon: Icon(Icons.note),
                  text: 'Notes',
                ),
                Tab(
                  icon: Icon(Icons.assignment_turned_in),
                  text: 'Tasks',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Appointments(),
              Contacts(),
              Notes(),
              Tasks()
            ],
          ),
        ),
      ),
    );
  }
}
