import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/utils/date_util.dart';

class NoteItemWidget extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;

  const NoteItemWidget({super.key, required this.note, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFCBCBCB), width: 1),
        ),
        child: Row(
          children: [
            Image.asset("assets/images/${note.image}", width: 80, height: 80),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(note.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(
                    note.content,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
  formatDateTime(note.dateTime), // Gunakan fungsi format lokal
  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}