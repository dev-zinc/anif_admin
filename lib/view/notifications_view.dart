
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

import 'package:anif_admin/lib/colors.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {

  void _onBackArrowPressed() {
    Navigator.pop(context);
  }

  void _onDropdownChanged(String? value) {

  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AnifColors.greyF2,
      body: Column(
        children: [
          // 뒤로 가기, 타이틀
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                InnerShadow(
                  shadows: const [
                    Shadow(
                        color: AnifColors.shadow,
                        offset: Offset(4, 4),
                        blurRadius: 4
                    )
                  ],
                  child: IconButton(
                      onPressed: _onBackArrowPressed,
                      iconSize: 40,
                      color: AnifColors.grey78,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AnifColors.grey78,
                        size: 40,
                      )
                  ),
                ), 
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "알림 목록",
                    style: TextStyle(
                        fontSize: 18,
                        color: AnifColors.grey44,
                        fontWeight: FontWeight.w500
                    )
                  )
                )
              ]
            ),
          ),
          // 알림 목록
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const DropdownMenu(
              dropdownMenuEntries: [],

            )
          ),
          SizedBox(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height * 0.7,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => Container(
                  width: 100,
                  height: 100,
                  child: Text("알림 $index"),
              ),
            )
          )
        ]
      ),
    );
  }
}