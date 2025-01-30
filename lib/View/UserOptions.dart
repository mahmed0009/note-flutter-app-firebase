import 'package:flutter/material.dart';
import 'package:notes_flutter_app_firebase/View/Create_Note.dart';

class UserOptions extends StatefulWidget {
  const UserOptions({super.key});

  @override
  State<UserOptions> createState() => _UserOptionsState();
}

class _UserOptionsState extends State<UserOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Options',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.create),
                title: Text('Create a Note'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateNote(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete a Note'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.receipt),
                title: Text('Read Your Notes'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.edit_document),
                title: Text('Edit a Note'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
