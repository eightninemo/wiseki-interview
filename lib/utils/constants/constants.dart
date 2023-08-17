import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wisekinoteapp/add_notes.dart';
import 'package:wisekinoteapp/utils/constants/navigation.dart';
import 'package:wisekinoteapp/utils/constants/text_style.dart';

import '../../services/api_service.dart';

final dataProvider = Provider<ApiServices>((ref) => ApiServices());

Map<String, String> headers = {
  HttpHeaders.contentTypeHeader: "application/json"
};

String baseUrl = 'https://wiseki-end.onrender.com';

Widget loadingWidget([Color? color]) => Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: color ?? Colors.white,
        ),
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
                pushTo(context, const AddNotes(), PushStyle.cupertino);
              },
              child: Row(
                children: [
                  const Icon(CupertinoIcons.add, size: 16),
                  const SizedBox(width: 10),
                  Text('Add New Note', style: mediumtextStyle(14)),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Row(
              children: [
                const Icon(CupertinoIcons.archivebox, size: 16),
                const SizedBox(width: 10),
                Text('All Notes', style: mediumtextStyle(14)),
              ],
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
