import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wisekinoteapp/models/note_model.dart';

// shows the state of loading
var isLoadingProvider = StateProvider((ref) {
  return false;
});

// shows the state of text field
var showSearchProvider = StateProvider((ref) {
  return false;
});

// shows the state of text
var searchText = StateProvider((ref) {
  return '';
});

// shows the state of result
var searchResult = StateProvider((ref) {
  return [];
});

// provider to expose data related to state notifier.
final itemsProvider = StateNotifierProvider<ListItemNotifier, List<Notes>>(
  (ref) => ListItemNotifier(), // call the class to access the values.
);

// a class that enables us to change the state of complex types.
class ListItemNotifier extends StateNotifier<List<Notes>> {
  ListItemNotifier() : super([]);

  // method to add item to list.
  void add(Notes data) {
    state = [...state, data];
  }

  // method to remove item to list.
  void remove(Notes data) {
    state = [...state.where((element) => element != data)];
  }

  // method to update list.
  void update(Notes data, Notes updatedData) {
    final updatedList = <Notes>[];
    for (var i = 0; i < state.length; i++) {
      if (state[i] == data) {
        updatedList.add(updatedData);
      } else {
        updatedList.add(state[i]);
      }
    }
    state = updatedList;
  }
}
