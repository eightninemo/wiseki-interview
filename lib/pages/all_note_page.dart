import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wisekinoteapp/utils/constants/constants.dart';

import '../providers/all_notes_provider.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/text_style.dart';

class AllNote extends StatefulHookConsumerWidget {
  const AllNote({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllNoteState();
}

class _AllNoteState extends ConsumerState<AllNote> {
  @override
  Widget build(BuildContext context) {
    final allnotes = ref.watch(allNotesProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('All Notes', style: semiboldtextStyle(18)),
        leading: closeIconButton(context),
      ),
      body: allnotes.isEmpty
          ? Center(
              child: Text(
              "List is empty.",
              style: mediumtextStyle(14, colorGray400),
            ))
          : ListView.builder(
              itemCount: allnotes.length > 20 ? 20 : allnotes.length,
              itemBuilder: (_, i) {
                final note = allnotes[i];
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
            ),
    );
  }
}
