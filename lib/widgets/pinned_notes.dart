import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:wisekinoteapp/utils/constants/text_style.dart';
import 'package:wisekinoteapp/utils/constants/toast.dart';
import 'package:wisekinoteapp/services/data_provider.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/constants.dart';

class Pinned extends HookConsumerWidget {
  const Pinned({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(getPinnedNotesProvider);
    //format date & time
    final dateFormat = DateFormat('MMM dd, y'); // 'MMMM dd, y'
    final timeFormat = DateFormat('h:mm a'); // 'MMMM dd, y'
    data.value?.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return data.when(
      data: (data) {
        var results = data;
        if (results.isEmpty) {
          return const Text('There is no note');
        }
        return SizedBox(
          height: 350,
          child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (_, i) {
              final note = results[i];
              return InkWell(
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Container(
                    height: 120,
                    width: 300,
                    decoration: BoxDecoration(
                        color: const Color(0xffFF9E9E),
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    note.title,
                                    style: boldtextStyle(16, colorWhite),
                                  ),
                                  PopupMenuButton(
                                    color: colorWhite,
                                    onSelected: (String result) {
                                      print('note $result');
                                      if (result == 'favourite') {
                                        displaySuccessMotionToast(context,
                                            'Note Added to Favourite.');
                                      } else if (result == 'deleted') {
                                        displaySuccessMotionToast(
                                            context, 'Note Deleted.');
                                      }
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<String>>[
                                      PopupMenuItem(
                                        value: 'favourite',
                                        child: Row(
                                          children: [
                                            const Icon(CupertinoIcons.heart,
                                                size: 16),
                                            const SizedBox(width: 10),
                                            Text('Favourite',
                                                style: mediumtextStyle(14)),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 'deleted',
                                        child: Row(
                                          children: [
                                            const Icon(CupertinoIcons.trash,
                                                size: 16),
                                            const SizedBox(width: 10),
                                            Text('Delete',
                                                style: mediumtextStyle(14)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                note.note,
                                style: regulartextStyle(16, colorWhite),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${timeFormat.format(note.createdAt)} | ${dateFormat.format(note.createdAt)}",
                            style: regulartextStyle(12, colorWhite),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) => const Text("An error occured."),
      loading: () => loadingWidget(primaryColor),
    );
  }
}
