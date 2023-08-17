// ignore_for_file: avoid_print, unnecessary_string_interpolations

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/note_model.dart';
import '../utils/constants/constants.dart';

class ApiServices {
  NoteModel? noteData;

  Future addNewNotes(
      BuildContext context, String title, String note, String type) async {
    final response = await post(
      Uri.parse('$baseUrl/api/notes/store'),
      headers: headers,
      body: jsonEncode({'title': '$title', 'note': '$note', 'type': '$type'}),
    );
    if (response.statusCode == 200) {
      var endPointResponse = jsonDecode(response.body);
      var message = endPointResponse['message'];
      var status = endPointResponse['status'];
      var data = endPointResponse['data'];
      noteData = NoteModel.fromJson(data);
      if (status == true) {
        print(endPointResponse);
      } else {
        print(message);
      }
    } else {
      print(Exception(response.reasonPhrase).toString());
      print(response.body);
    }
  }

  // get saved list of notes
  Future<List<NoteModel>> getNotes() async {
    final response = await get(Uri.parse('$baseUrl/api/notes/all'));
    Map<String, dynamic> endPointResponse = json.decode(response.body);
    if (response.statusCode == 200 && endPointResponse['data'] != null) {
      Map<String, dynamic> endPointResponse = json.decode(response.body);
      List<dynamic> data = endPointResponse['data'];
      print(response.body);
      return data.map((e) => NoteModel.fromJson(e)).toList();
    } else {
      print(Exception(response.reasonPhrase).toString());
      print(response.body);
      return <NoteModel>[].toList();
    }
  }

  // get pinned list of notes
  Future<List<NoteModel>> getPinnedNotes() async {
    final response = await get(Uri.parse('$baseUrl/api/notes/allpinned'));
    Map<String, dynamic> endPointResponse = json.decode(response.body);
    if (response.statusCode == 200 && endPointResponse['data'] != null) {
      Map<String, dynamic> endPointResponse = json.decode(response.body);
      List<dynamic> data = endPointResponse['data'];
      print(response.body);
      return data.map((e) => NoteModel.fromJson(e)).toList();
    } else {
      print(Exception(response.reasonPhrase).toString());
      print(response.body);
      return <NoteModel>[].toList();
    }
  }
}
