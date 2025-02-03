import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:template68/provider/provider.dart';
import 'package:template68/widgets/widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(noteProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => addEditButton(ref),
              icon: Icon(Icons.add_circle_outlined)),
          IconButton(
              onPressed: () => removeAllButton(ref),
              icon: Icon(Icons.delete_forever_outlined)),
        ],
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return ListTile(
            title: Text(note.name),
            subtitle: Text(note.desc),
            leading: Checkbox(
              value: note.isDone,
              onChanged: (value) {
                ref.read(noteProvider.notifier).toggleNote(note.id);
              },
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => removeButton(ref, note.id)),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.yellowAccent),
                  onPressed: () => addEditButton(ref, id: note.id),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
