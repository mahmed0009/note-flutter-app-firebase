import 'package:flutter/material.dart';
import 'package:notes_flutter_app_firebase/Model/Save_Note.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  // Add a method to handle the note creation logic
  void createNote() async {
    final note = Note(
      title: titleController.text,
      content: contentController.text,
      createdAt: DateTime.now(),
    );

    try {
      // Call the model's saveNote method to save the note
      await note.saveNote();
      // You can show a confirmation message or do something else here
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Note saved successfully')));
      // Optionally clear the text fields after saving
      titleController.clear();
      contentController.clear();
    } catch (error) {
      print("Error saving note: $error");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error saving note')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Note Title'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Note Content'),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: createNote, // Directly call the createNote method
              child: Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}
