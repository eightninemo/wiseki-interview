import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wisekinoteapp/pages/all_note_page.dart';
import 'package:wisekinoteapp/utils/constants/text_style.dart';

import 'colors.dart';
import 'navigation.dart';

Map<String, String> headers = {
  HttpHeaders.contentTypeHeader: "application/json"
};

String baseUrl = 'https://wiseki-end.onrender.com';

BoxDecoration noteDecoration() => const BoxDecoration(
      border: Border(
        bottom: BorderSide(color: colorGray400),
      ),
    );

Widget loadingWidget([Color? color]) => const Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: colorBlack,
        ),
      ),
    );
// close button with icon.
Widget closeIconButton(BuildContext context, [Widget? icon]) => GestureDetector(
      onTap: () => pop(context),
      child: SizedBox(
        height: 40,
        width: 40,
        child: icon ?? const Icon(CupertinoIcons.arrow_left),
      ),
    );

Widget homeiconlist() => Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset(
          'assets/icons/edit.svg',
          height: 18,
        ),
        const SizedBox(width: 5),
        SvgPicture.asset(
          'assets/icons/grid-view.svg',
          height: 18,
        ),
        const SizedBox(width: 5),
        SvgPicture.asset(
          'assets/icons/Group 15.svg',
          height: 18,
        ),
        const SizedBox(width: 5),
      ],
    );

Widget drawerlist(context) => Drawer(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 120),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                pop(context);
                pushTo(context, const AllNote());
              },
              child: Row(
                children: [
                  const Icon(CupertinoIcons.archivebox, size: 16),
                  const SizedBox(width: 10),
                  Text('All Notes', style: mediumtextStyle(14)),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const Icon(CupertinoIcons.book, size: 16),
                const SizedBox(width: 10),
                Text('Notebook', style: mediumtextStyle(14)),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const Icon(CupertinoIcons.heart, size: 16),
                const SizedBox(width: 10),
                Text('Favourite', style: mediumtextStyle(14)),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const Icon(CupertinoIcons.trash, size: 16),
                const SizedBox(width: 10),
                Text('Deleted', style: mediumtextStyle(14)),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const Icon(CupertinoIcons.settings, size: 16),
                const SizedBox(width: 10),
                Text('Settings', style: mediumtextStyle(14)),
              ],
            ),
          ],
        ),
      ),
    );
