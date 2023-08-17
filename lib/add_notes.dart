// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wisekinoteapp/utils/constants/navigation.dart';

import 'utils/constants/constants.dart';
import 'utils/constants/input_fields.dart';
import 'utils/constants/text_style.dart';
import 'services/data_provider.dart';
import 'services/state_provider.dart';

class AddNotes extends ConsumerStatefulWidget {
  const AddNotes({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddNotesState();
}

class _AddNotesState extends ConsumerState<AddNotes> {
  // form key
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  String note = '';
  String title = '';
  bool loading = false;

  //
  void _clearField() {
    titleController.clear();
    noteController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var loading = ref.watch(isLoadingProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('All Notes', style: semiboldtextStyle(18)),
        actions: [
          InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(CupertinoIcons.search),
              )),
        ],
      ),
      drawer: Drawer(
        width: 200,
        child: ListView(
          children: const [
            Text('All Notes'),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    textInput(
                      context,
                      hintText: 'Enter Note Title',
                      validateText: 'Enter Note Title',
                      titleController,
                      inputType: TextInputType.emailAddress,
                      onChanged: (value) => title = value,
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        textInput(
                          context,
                          noteController,
                          maxLine: 10,
                          contentTop: 40,
                          inputType: TextInputType.multiline,
                          validateText: 'Enter Note Content',
                          onChanged: (p0) => note = p0,
                          hintText: 'Enter Note Content',
                        ),
                        PopupMenuButton(
                          onSelected: (String result) {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              ref.read(isLoadingProvider.notifier).state = true;
                              print(title + ' ' + note + ' ' + result);
                              ref.read(newNoteProvider(
                                  context, title, note, result));
                              _clearField();
                              Future.delayed(const Duration(seconds: 5), () {
                                ref.read(isLoadingProvider.notifier).state =
                                    false;
                                pop(context);
                              });
                            } else {
                              ref.read(isLoadingProvider.notifier).state =
                                  false;
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem(
                              value: 'save',
                              child: Row(
                                children: [
                                  Icon(Icons.save),
                                  SizedBox(width: 5),
                                  Text('Save'),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'pinned',
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.pin_fill),
                                  SizedBox(width: 5),
                                  Text('Pin Note'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            loading ? loadingWidget() : Container(),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                      color: Color(0xffF9F9F9),
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xff6E74A3),
                        ),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
