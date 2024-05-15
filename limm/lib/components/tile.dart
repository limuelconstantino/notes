import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String note;
  final VoidCallback onRemove;
  final VoidCallback onEdit;

  NoteTile({
    required this.note,
    required this.onRemove,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 54, 155, 222),  
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),  
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: Icon(Icons.note, color: Color.fromARGB(255, 23, 127, 212)),  
        title: Text(note),
        subtitle: Text('Tap to edit'),  
        trailing: Wrap(
          spacing: 12,  
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Color.fromARGB(255, 143, 174, 144),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Color.fromARGB(149, 132, 163, 160),
              onPressed: onRemove,
            ),
          ],
        ),
        onTap: onEdit,
      ),
    );
  }
}

