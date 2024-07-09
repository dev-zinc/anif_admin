import 'package:anif_admin/domain/user.dart';
import 'package:anif_admin/lib/colors.dart';
import 'package:anif_admin/view/user_detailed_view.dart';
import 'package:flutter/material.dart';

import 'package:anif_admin/lib/keyboard_subscription.dart';

import 'package:anif_admin/lib/head.dart';
import 'package:provider/provider.dart';

class UserManageView extends StatefulWidget {
  const UserManageView({super.key});

  @override
  State<StatefulWidget> createState() => _UserManageViewState();
}

class _UserManageViewState extends State<UserManageView>
    with KeyboardSubscription {
  final UserViewModel _userViewModel = UserViewModel();

  @override
  void initState() {
    super.initState();
    subscribeKeyboardEvent((isVisible) {
      if (!isVisible) {
        _onLeaveFocus();
      }
    });
  }

  @override
  void dispose() {
    cancelSubscription();
    super.dispose();
  }

  void _onTabUser(User user) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          ChangeNotifierProvider(
            create: (BuildContext context) => user,
            builder: (context, child) => const UserDetailedView()
          )
      )
    );
  }

  void _onLeaveFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Widget createOnlineUserList() {
    final onlineUsers =
        _userViewModel.users.where((user) => user.isOnline).toList();

    return Stack(children: [
      Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: _createUserList(onlineUsers)),
      _createListHeader(users: onlineUsers, isOnline: true)
    ]);
  }

  Widget createOfflineUserList() {
    final offlineUsers =
        _userViewModel.users.where((user) => !user.isOnline).toList();

    return Stack(children: [
      Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: _createUserList(offlineUsers)),
      _createListHeader(users: offlineUsers, isOnline: false)
    ]);
  }

  Widget _createListHeader(
      {required List<User> users, required bool isOnline}) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 4),
        alignment: Alignment.topCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: isOnline
                            ? AnifGreenColors.green
                            : AnifColors.grey88,
                        border: Border.all(
                            color: isOnline
                                ? AnifGreenColors.greenStroke
                                : AnifColors.greyDD,
                            width: 1),
                        boxShadow: const [
                          BoxShadow(
                            color: AnifColors.shadow,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          )
                        ])),
                Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 3),
                    child: Text(isOnline ? '온라인' : '오프라인',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: AnifColors.grey44)))
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 25),
              child: Text('${users.length}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: AnifColors.grey44)),
            )
          ],
        ));
  }

  Widget _createUserList(List<User> users) {
    return ExpansionTile(
      initiallyExpanded: true,
      visualDensity:
          const VisualDensity(vertical: VisualDensity.minimumDensity),
      dense: true,
      shape: const RoundedRectangleBorder(),
      tilePadding: const EdgeInsets.symmetric(horizontal: 20),
      // childrenPadding: const EdgeInsets.all(0),
      collapsedBackgroundColor: AnifColors.greyF2,
      backgroundColor: AnifColors.greyF2,
      title: const Text(" "),
      children: users
          .map((user) => InkWell(
              enableFeedback: false,
              onTap: () => _onTabUser(user),
              child: Container(
                margin: const EdgeInsets.only(
                    left: 40, right: 40, top: 2, bottom: 2),
                child: Row(
                  children: [
                    FutureBuilder(
                        future: user.createHeadImage(45),
                        builder: getLoadingBoxBuilder(size: 45)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 6),
                            alignment: Alignment.centerLeft,
                            child: Text(user.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: AnifColors.grey44,
                                ))),
                        Container(
                            margin: const EdgeInsets.only(left: 6),
                            alignment: Alignment.centerLeft,
                            child: Text(
                                user.islandName == null
                                    ? "섬 없음"
                                    : '${user.islandName} 소속',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AnifColors.grey88,
                                )))
                      ],
                    )
                  ],
                ),
              )))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SearchBar(
              backgroundColor: const WidgetStatePropertyAll(AnifColors.greyF2),
              onTapOutside: (_) => _onLeaveFocus(),
              onSubmitted: (value) {
                _onLeaveFocus();

                //TODO: 검색
              },
              hintText: "닉네임, 이름 또는 섬 이름으로 검색",
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))),
              textStyle: const WidgetStatePropertyAll(TextStyle(
                fontSize: 18,
                color: AnifColors.grey88,
              )),
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.search,
                    size: 30,
                  )),
              constraints: const BoxConstraints(maxHeight: 50)),
          Expanded(
              child: Stack(children: [
            Container(
                margin: const EdgeInsets.only(top: 5),
                child: ListView(children: [
                  createOnlineUserList(),
                  Container(
                      margin: const EdgeInsets.only(top: 2, bottom: 200),
                      child: createOfflineUserList())
                ])),
            Positioned(
                right: 0,
                bottom: 70,
                child: Container(
                    decoration: const BoxDecoration(
                        color: AnifColors.greyF2,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AnifColors.shadow,
                            blurRadius: 4,
                            offset: Offset(4, 0),
                          ),
                          BoxShadow(
                            color: AnifColors.shadow,
                            blurRadius: 4,
                            offset: Offset(-4, 0),
                          )
                        ]),
                    child: IconButton(
                      enableFeedback: false,
                      iconSize: 40,
                      icon: const Icon(Icons.arrow_upward),
                      onPressed: () => PrimaryScrollController.of(context)
                          .animateTo(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut),
                    )))
          ]))
        ],
      ),
    );
  }
}
