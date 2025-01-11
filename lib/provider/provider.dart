import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:template68/models/note.dart';
import 'package:uuid/uuid.dart';

class Provider extends StateNotifier<List<Note>> {
  Provider() : super([]);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  void addNote() {
    if (nameController.text.isNotEmpty && descController.text.isNotEmpty) {
      final note = Note(
        id: const Uuid().v4(),
        name: nameController.text.trim(),
        desc: descController.text.trim(),
        isDone: false,
      );
      state = [...state, note];
      nameController.clear();
      descController.clear();
      Get.back();
    }
  }

  void editNote(String id) {
    final note = state.firstWhere((note) => note.id == id);
    if (nameController.text.isNotEmpty && descController.text.isNotEmpty) {
      final newNote = note.copyWith(
        name: nameController.text.trim(),
        desc: descController.text.trim(),
      );
      state = state.map((note) => note.id == id ? newNote : note).toList();
      nameController.clear();
      descController.clear();
      Get.back();
    }
  }

  void removeNote(String id) {
    state = state.where((note) => note.id != id).toList();
  }

  void removeAll() {
    state = [...state..clear()];
  }

  void toggleNote(String id) {
    state = state
        .map((note) =>
            note.id == id ? note.copyWith(isDone: !note.isDone) : note)
        .toList();
  }
}

final noteProvider = StateNotifierProvider<Provider, List<Note>>((ref) {
  return Provider();
});
