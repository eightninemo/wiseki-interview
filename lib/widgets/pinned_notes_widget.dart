import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wisekinoteapp/utils/constants/colors.dart';
import 'package:wisekinoteapp/utils/constants/constants.dart';
import 'package:wisekinoteapp/utils/constants/text_style.dart';

import '../providers/pinned_notes_provider.dart';

class PinnedNotes extends StatefulHookConsumerWidget {
  const PinnedNotes({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PinnedNotesState();
}

class _PinnedNotesState extends ConsumerState<PinnedNotes> {
  @override
  Widget build(BuildContext context) {
    final pinnednotes = ref.watch(pinnedNotesProvider);
    return pinnednotes.isEmpty
        ? Center(
            child: Text(
            "List is empty.",
            style: mediumtextStyle(14, colorGray400),
          ))
        : ListView.builder(
            itemCount: pinnednotes.length > 3 ? 3 : pinnednotes.length,
            itemBuilder: (_, i) {
              final note = pinnednotes[i];
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
