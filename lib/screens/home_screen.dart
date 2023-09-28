import 'package:flutter/material.dart';
import 'package:flutter_notes/models/note_model.dart';
import 'package:flutter_notes/screens/create_note.dart';
import 'package:flutter_notes/screens/widgets/note_card.dart';
import 'package:flutter_notes/style/app_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appstyle.barColor,
        title: const Text("Rannn Notes"),
      ),
      body: Container(
        color: Appstyle.mainColor,
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteCard(
              note: notes[index],
              index: index,
              onNoteDeleted: onNoteDeleted,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateNote(
              onNewNoteCreated: onNewNoteCreated,
            ),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void onNewNoteCreated(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  void onNoteDeleted(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }
}
