class Note {
  // Properti data Note
  int? id;
  String title;
  String content;
  String dateTime;
  String image;

  // Konstruktor Note dengan properti wajib dan opsional
  Note({
    this.id,
    required this.title,
    required this.content,
    required this.dateTime,
    required this.image,
  });

  // Mengubah objek Note menjadi Map agar mudah disimpan atau dikirim
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "dateTime": dateTime,
      "image": image,
    };
  }

  // Membuat objek Note dari data Map, misal dari database atau JSON
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map["id"],
      title: map["title"],
      content: map["content"],
      dateTime: map["dateTime"],
      image: map["image"],
    );
  }
}