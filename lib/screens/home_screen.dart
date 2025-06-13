import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/screens/add_note_screen.dart';
import 'package:notes_app/screens/detail_screen.dart';
import 'package:notes_app/service/note_service.dart';
import 'package:notes_app/widget/empty_data_widget.dart';
import 'package:notes_app/widget/note_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NoteService _noteService = NoteService();

  List<Note> notesList = [];

  @override
  void initState() {
    super.initState();
    _loadNotes(); // ambil data dari database saat layar pertama kali ditampilkan
  }

  void _loadNotes() async {
    final data =
        await _noteService.getAllNotes(); // ambil semua catatan dari database
    setState(() {
      notesList = data; // simpan hasil ke dalam notesList agar ditampilkan
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar is hidden
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset("assets/images/logo.png", width: 28, height: 28),
            const SizedBox(width: 8),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Kodein ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Notes",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: notesList.isEmpty
          ? const EmptyDataWidget()
          : ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                final Note note = notesList[index];

                return NoteItemWidget(
                  note: note,
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(note: note),
                      ),
                    );

                    if (result == true) {
                      _loadNotes(); // refresh data dari database
                    }
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );

          if (result == true) {
            _loadNotes(); // refresh data dari database
          }
        },
        backgroundColor: Colors.deepOrange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
