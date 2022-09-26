// import 'package:flutter/cupertino.dart';
// import 'package:hello/contacts_demo_v1.dart';
// import 'package:contacts_service/contacts_service.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class ContactListPageState extends State<ContactListPage>{
//   Iterable<Contact> _contacts = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _checkPermission();
//   }
//
//   _checkPermission() async{
//     await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
//     _refreshContacts();
//   }
//
//   _refreshContacts() async {
//     Iterable<Contact> contacts = await ContactsService.getContacts(withThumbnails: false);
//     setState(() {
//       _contacts = contacts;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _contacts.isNotEmpty
//         ? ListView.builder(itemCount: _contacts.length, itemBuilder: _buildRow,)
//         : Center(child: CircularProgressIndicator(),);
//   }
//
//   Widget _buildRow(BuildContext context, int i){
//     Contact c = _contacts.elementAt(i);
//     print(c.avatar!.sublist(0));
//     return ListTile(
//       leading: (c.avatar != null && c.avatar!.isNotEmpty)
//           ? CircleAvatar(backgroundImage: MemoryImage(c.avatar!.sublist(0)))
//           : CircleAvatar(child: Text(c.initials())),
//       title: Text(c.displayName ?? ''),
//     );
//   }
//
// }
