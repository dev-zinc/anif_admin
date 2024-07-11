import 'package:anif_admin/lib/colors.dart';
import 'package:anif_admin/lib/head.dart';
import 'package:anif_admin/lib/header.dart';
import 'package:anif_admin/viewmodel/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user/user.dart';

class UserDetailedView extends StatefulWidget {
  const UserDetailedView({super.key});

  @override
  State<StatefulWidget> createState() => _UserDetailedViewState();
}

class _UserDetailedViewState extends State<UserDetailedView> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: AnifColors.greyF2,
      body: Column(
        children: [
          createPopableHeader(context: context, title: "유저 상세정보"),
          Container(
              margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                FutureBuilder(
                    initialData: Container(
                        width: 150, height: 150, color: AnifColors.grey44),
                    future: user.createHeadImage(150),
                    builder: getLoadingBoxBuilder(size: 150)),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(user.name,
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold))),
                Text(
                    user.islandName != null
                        ? "'${user.islandName}' 섬 소속"
                        : '섬 없음',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal))
              ])),
          Container(
              margin: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text('uuid: ${user.uuid}',
                            style: const TextStyle(fontSize: 14, color: AnifColors.grey44))),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text('등급: ${user.gradeObject.displayName}',
                            style: const TextStyle(fontSize: 14, color: AnifColors.grey44))),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10, left: 20),
                        child: Text(user.jobStatObject.levels.keys.join(', '),
                            style: const TextStyle(fontSize: 14, color: AnifColors.grey44))),

                  ]))
        ],
      ),
    );
  }
}
