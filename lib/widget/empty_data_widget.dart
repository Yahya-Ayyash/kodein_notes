import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/add_note.png', width: 200),
          const SizedBox(height: 16),
          const Text(
            "Add your first note",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 8),
          const Text(
            "Save your thoughts, tasks\nor inspirations",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}