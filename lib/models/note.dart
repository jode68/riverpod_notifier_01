import 'dart:convert';
import 'package:uuid/uuid.dart';

class Note {
  final id = Uuid().v1();
  final String name;
  final String desc;
  bool isDone = false;

  Note({
    required this.name,
    required this.desc,
    required this.isDone,
    required String id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
      'isDone': isDone,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  Note copyWith({
    String? name,
    String? desc,
    bool? isDone,
  }) {
    return Note(
      id: id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      isDone: isDone ?? this.isDone,
    );
  }
}
