import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/constants/constants.dart';

newNoteProvider(context, title, note, type) => FutureProvider((ref) {
      ref.watch(dataProvider).addNewNotes(context, title, note, type);
    });

final getNotesProvider =
    FutureProvider((ref) => ref.watch(dataProvider).getNotes());

final getPinnedNotesProvider =
    FutureProvider((ref) => ref.watch(dataProvider).getPinnedNotes());
