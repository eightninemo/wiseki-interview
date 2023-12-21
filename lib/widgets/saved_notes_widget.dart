import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/saved_notes_provider.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/constants.dart';
import '../utils/constants/text_style.dart';

class SavedNotes extends StatefulHookConsumerWidget {
  const SavedNotes({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SavedNotesState();
}

class _SavedNotesState extends ConsumerState<SavedNotes> {
  @override
  Widget build(BuildContext context) {
    final savednotes = ref.watch(savedNotesProvider);
    return savednotes.isEmpty
        ? Center(
            child: Text(
            "List is empty.",
            style: mediumtextStyle(14, colorGray400),
          ))
        : ListView.builder(
            itemCount: savednotes.length > 3 ? 3 : savednotes.length,
            itemBuilder: (_, i) {
              final note = savednotes[i];
              return Container(
                decoration: noteDecoration(),
                child: Padding(
                  padding: const EdgeInsets.only(right: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ListTile(
                        title: Text(
                          note.title,
                          style: boldtextStyle(14),
                        ),
                        subtitle: Text(
                          note.description,
                          style: regulartextStyle(14),
                        ),
                      ),
                      Text(
                        note.date,
                        style: regulartextStyle(12),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
