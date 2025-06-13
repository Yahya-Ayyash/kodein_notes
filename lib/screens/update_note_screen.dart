import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/service/note_service.dart';

class UpdateNoteScreen extends StatefulWidget {
  final Note note; // <-- tambahkan

  const UpdateNoteScreen({super.key, required this.note});
  

  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final NoteService _noteService = NoteService();
  final _titleFocusNode = FocusNode();
  final _contentFocusNode = FocusNode();

  String _selectedImage = "0.png";


  @override
  void initState() {
    super.initState();
    _titleController.text = widget.note.title;
    _contentController.text = widget.note.content;
    _selectedImage = widget.note.image;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // <-- Kembali ke screen sebelumnya
          },
          icon: Icon(Icons.arrow_back, color: Colors.deepOrange),
        ),
        title: const Text(
          "Update Note",
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 16),
          // TextField Judul
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _titleController,
                focusNode: _titleFocusNode,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  hintText: "Note Title",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xffc5c5c5), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.deepOrangeAccent, width: 1.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // TextField Konten
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _contentController,
                focusNode: _contentFocusNode,
                maxLines: 3,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  hintText: "Note Content",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xffc5c5c5), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.deepOrangeAccent, width: 1.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Pilihan Gambar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: SizedBox(
              height: 160,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImage = '$index.png';
                      });
                    },
                    child: Container(
                      width: 140,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1.5,
                          color: _selectedImage == '$index.png'
                              ? Colors.deepOrangeAccent
                              : const Color(0xffc5c5c5),
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/$index.png',
                        fit: BoxFit.cover,
                        height: 100,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(14),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
           onPressed: () async {
  final title = _titleController.text.trim();
  final content = _contentController.text.trim();

  if (title.isEmpty || content.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Judul dan isi catatan tidak boleh kosong.'),
        backgroundColor: Colors.redAccent,
      ),
    );
    return;
  }

  final updatedNote = Note(
    id: widget.note.id,
    title: title,
    content: content,
    image: _selectedImage,
    dateTime: DateTime.now().toString(),
  );

  await _noteService.updateNote(updatedNote); // simpan ke database
  Navigator.pop(context, true); // kirim sinyal bahwa update selesai
},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text(
              'Update',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}