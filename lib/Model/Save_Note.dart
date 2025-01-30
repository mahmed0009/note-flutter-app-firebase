import 'package:cloud_firestore/cloud_firestore.dart';

class SaveNote {
  String Note = '';

  SaveNote(this.Note);

  final FirebaseFirestore Save = FirebaseFirestore.instance;

  Future<void> addUser() async {
    await Save.collection("Notes").add({
      "Note": Note,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }
}
