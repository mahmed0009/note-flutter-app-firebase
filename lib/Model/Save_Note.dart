import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String? id;
  String title;
  String content;
  DateTime createdAt;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  // Convert a Note into a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'createdAt': createdAt,
    };
  }

  // Convert a Map from Firestore into a Note
  factory Note.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Note(
      id: doc.id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  // Save the note to Firebase Firestore
  Future<void> saveNote() async {
    final firestore = FirebaseFirestore.instance;
    if (id == null) {
      // Adding new note
      await firestore.collection('notes').add(toMap());
    } else {
      // Updating existing note
      await firestore.collection('notes').doc(id).update(toMap());
    }
  }
}
