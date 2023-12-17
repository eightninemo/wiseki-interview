import 'package:hooks_riverpod/hooks_riverpod.dart';

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
