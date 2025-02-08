import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:template68/provider/provider.dart';

Future<void> addEditButton(WidgetRef ref, {String id = ''}) async {
  if (id == '') {
    ref.read(noteProvider.notifier).nameController.clear();
    ref.read(noteProvider.notifier).descController.clear();
  } else {
    final note = ref.read(noteProvider).where((note) => note.id == id).first;
    ref.read(noteProvider.notifier).nameController.text = note.name;
    ref.read(noteProvider.notifier).descController.text = note.desc;
  }
  Get.defaultDialog(
    title: id == '' ? 'Add Note' : 'Edit Note',
    content: Column(
      children: [
        TextField(
          controller: ref.read(noteProvider.notifier).nameController,
          autocorrect: false,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Enter name',
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: ref.read(noteProvider.notifier).descController,
          autocorrect: false,
          decoration: const InputDecoration(
            hintText: 'Enter description',
          ),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            if (id == '') {
              ref.read(noteProvider.notifier).addNote();
            } else {
              ref.read(noteProvider.notifier).editNote(id);
            }
          },
          child: Text(id == '' ? 'Add Todo' : 'Edit Todo'),
        ),
      ],
    ),
  );
}

Future<void> removeButton(WidgetRef ref, String id) async {
  final note = ref.read(noteProvider).firstWhere((note) => note.id == id);
  if (note.isDone) {
    Get.defaultDialog(
      title: 'Remove Todo',
      content: const Text('Are you sure?'),
      actions: [
        ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(noteProvider.notifier).removeNote(id);
            Get.back();
          },
          child: const Text('Remove'),
        ),
      ],
    );
  }
}

Future<void> removeAllButton(WidgetRef ref) async {
  if (ref.read(noteProvider).isNotEmpty) {
    Get.defaultDialog(
      title: 'Remove All',
      content: const Text('Are you sure?'),
      actions: [
        ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(noteProvider.notifier).removeAll();
            Get.back();
          },
          child: const Text('Remove All'),
        ),
      ],
    );
  }
}
