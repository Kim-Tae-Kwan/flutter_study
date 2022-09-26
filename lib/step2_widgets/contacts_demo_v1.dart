import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(const ListViewDynamicApp());

class ListViewDynamicApp extends StatelessWidget {
  static const String _title = '동적 ListView 위젯 데모';

  const ListViewDynamicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),),
        body: const ContactListPage(),
      ),
    );
  }
}

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State createState() {
    return ContactListPageState();
  }
}

class ContactListPageState extends State<ContactListPage>{
  Iterable<Contact> _contacts = [];

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  _checkPermission() async{
    if(await Permission.contacts.request().isGranted){
      _refreshContacts();
    }

    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
    ].request();
    print(statuses[Permission.location]);
  }

  _refreshContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _contacts.isNotEmpty
        ? ListView.builder(itemCount: _contacts.length, itemBuilder: _buildRow,)
        : Center(child: CircularProgressIndicator(),);
  }

  Widget _buildRow(BuildContext context, int i){
    Contact c = _contacts.elementAt(i);
    print(c.avatar!.sublist(0));
    return ListTile(
      leading: (c.avatar != null && c.avatar!.isNotEmpty)
          ? CircleAvatar(backgroundImage: MemoryImage(c.avatar!.sublist(0)))
          : CircleAvatar(child: Text(c.initials())),
      title: Text(c.displayName ?? ''),
    );
  }

}