import 'package:flutter/material.dart';
import '../components/tile.dart';

class KahitAno extends StatefulWidget {
  @override
  _KahitAnoState createState() => _KahitAnoState();
}

class _KahitAnoState extends State<KahitAno> {
  final List<String> _notes = [];

  void _addNote() {
    TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(210, 9, 140, 72),  
          title: Text('Add Note'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Enter your note here"),
            maxLines: 3,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  _notes.add(_controller.text);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editNote(
      int index,
      ) {
    TextEditingController _controller = TextEditingController();
    _controller.text = _notes[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(198, 67, 147, 209),  
          title: Text('Edit Note'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Edit your note here"),
            maxLines: 3,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  _notes[index] = _controller.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteNote(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 60, 124, 145),  
          title: Text('Delete Note'),
          content: Text('Are you sure you want to delete this note?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  _notes.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 238, 238),  
      appBar: AppBar(
        title: Text('Notes App'),
      ),
      body: _notes.isEmpty
          ? Center(child: Text('No notes yet. Add a new note!'))
          : ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return NoteTile(
            note: _notes[index],
            onEdit: () => _editNote(index),
            onRemove: () => _deleteNote(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }
}