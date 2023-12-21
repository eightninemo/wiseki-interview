// ignore_for_file: unused_result

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wisekinoteapp/providers/state_provider.dart';
import 'package:wisekinoteapp/utils/constants/colors.dart';
import 'package:wisekinoteapp/utils/constants/constants.dart';
import 'package:wisekinoteapp/utils/constants/navigation.dart';
import 'package:wisekinoteapp/utils/constants/text_style.dart';

import '../utils/constants/input_fields.dart';
import '../widgets/pinned_notes_widget.dart';
import '../widgets/saved_notes_widget.dart';
import 'add_notes_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool showSearch = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    showSearch = ref.watch(showSearchProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('All Notes', style: semiboldtextStyle(18)),
        actions: [
          InkWell(
              onTap: () {
                ref.read(showSearchProvider.notifier).state = true;
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(CupertinoIcons.search),
              )),
        ],
      ),
      drawer: drawerlist(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushTo(context, const AddNotes(), PushStyle.cupertino);
        },
        backgroundColor: colorBlack,
        child: const Icon(CupertinoIcons.add),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                showSearch
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: SizedBox(
                              width: 320,
                              height: 40,
                              child: textInput(
                                context,
                                searchController,
                                hintText: 'Search Note',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              ref.read(showSearchProvider.notifier).state =
                                  false;
                            },
                            child: const Icon(
                              CupertinoIcons.multiply,
                              size: 20,
                            ),
                          )
                        ],
                      )
                    : Container(),
                showSearch
                    ? const SizedBox(height: 20)
                    : const SizedBox(height: 0),
                homeiconlist(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'PINNED NOTES',
                        style: mediumtextStyle(16),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        color: colorBlack,
                        height: 1,
                        width: 250,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 350,
              child: PinnedNotes(), // widget to display list of pinned widget.
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'OTHER NOTES',
                    style: mediumtextStyle(16),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    color: colorBlack,
                    height: 1,
                    width: 250,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(
              height: 350,
              child: SavedNotes(), // widget to display list of saved widget.
            ),
          ],
        ),
      ),
    );
  }
}
