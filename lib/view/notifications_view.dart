import 'package:anif_admin/lib/head.dart';
import 'package:anif_admin/lib/header.dart';
import 'package:anif_admin/lib/time.dart';
import 'package:anif_admin/model/notification/notification.dart' as model;
import 'package:anif_admin/model/notification/notification_type.dart';
import 'package:anif_admin/viewmodel/notification_view_model.dart';
import 'package:flutter/material.dart';

import 'package:anif_admin/lib/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  late NotificationViewModel _notificationViewModel;
  NotificationType? _selectedType;

  @override
  void initState() {
    super.initState();
  }

  void _onDropdownSelected(NotificationType? value) {
    setState(() => _selectedType = value);
  }

  void _onTapNotification(SharedPreferences sharedPreference,
      model.Notification notification) async {
    var uri = Uri.parse(notification.discordUrl);

    if (!_notificationViewModel.hasRead(sharedPreference, notification)) {
      setState(
          () => _notificationViewModel.read(sharedPreference, notification));
    }
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    _notificationViewModel = Provider.of<NotificationViewModel>(context);
    final mediaQuery = MediaQuery.of(context);

    if (_selectedType == null) {
      setState(() => _selectedType = NotificationType.values.first);
    }

    return Scaffold(
      backgroundColor: AnifColors.greyF2,
      body: Column(children: [
        createPopableHeader(context: context, title: "알림 목록"),
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 78, bottom: 10),
            child: DropdownButton<NotificationType>(
              isDense: true,
              dropdownColor: AnifColors.greyF2,
              value: _selectedType ?? NotificationType.values.first,
              onChanged: _onDropdownSelected,
              underline: Container(height: 0),
              icon: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_drop_down, size: 20)),
              items: NotificationType.values
                  .map((type) => DropdownMenuItem<NotificationType>(
                        value: type,
                        child: Text(
                          type.displayName,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AnifColors.grey44,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                  .toList(),
            )),
        Expanded(
            child: FutureBuilder(
                future: _notificationViewModel.fetchNotificationList(),
                builder: (context, snapshot) {
                  final List<model.Notification> notifications;

                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    notifications = snapshot.data!
                        .where((notification) =>
                            _selectedType == NotificationType.all ||
                            notification.notificationTypes
                                .contains(_selectedType))
                        .toList();
                  } else {
                    return const CircularProgressIndicator();
                  }
                  return Container(
                      child: notifications.isEmpty
                          ? const Align(
                              alignment: Alignment.center,
                              child: Text("알림이 없습니다.",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: AnifColors.greyAA,
                                  )))
                          : FutureBuilder(
                              future: SharedPreferences.getInstance(),
                              builder: (context, snapshot) {
                                final SharedPreferences sharedPreference;

                                if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                    snapshot.hasData) {
                                  sharedPreference =
                                      snapshot.data as SharedPreferences;
                                } else {
                                  return const CircularProgressIndicator();
                                }

                                return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: notifications.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var notification = notifications[index];
                                      var notificationTypes = notification
                                          .notificationTypes
                                        ..sort((a, b) => a.displayName
                                            .compareTo(b.displayName));
                                      return Container(
                                        width: mediaQuery.size.width,
                                        // height: 70,
                                        color: _notificationViewModel.hasRead(
                                                sharedPreference, notification)
                                            ? AnifColors.greyDD
                                            : AnifColors.greyF2,
                                        child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 40),
                                            child: InkWell(
                                                onTap: () => _onTapNotification(
                                                    sharedPreference,
                                                    notification),
                                                child: Column(children: [
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(children: [
                                                          FutureBuilder(
                                                              initialData: Container(
                                                                  width: 24,
                                                                  height: 24,
                                                                  color: AnifColors
                                                                      .grey44),
                                                              future: notification
                                                                  .userObject
                                                                  .createHeadImage(
                                                                      24),
                                                              builder:
                                                                  getLoadingBoxBuilder(
                                                                      size:
                                                                          24)),
                                                          Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 6),
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                  notification
                                                                      .title,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: AnifColors
                                                                        .grey44,
                                                                  )))
                                                        ]),
                                                        Text(
                                                            formatDuration(
                                                                notification
                                                                    .computePassedTime()),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              color: AnifColors
                                                                  .grey44,
                                                            ))
                                                      ]),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                            children: notificationTypes
                                                                .map((type) => type
                                                                    .createTypeBadge())
                                                                .toList()),
                                                        Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 10),
                                                            child: Text(
                                                                _notificationViewModel.hasRead(
                                                                        sharedPreference,
                                                                        notification)
                                                                    ? "읽음"
                                                                    : "",
                                                                style: const TextStyle(
                                                                    fontSize: 9,
                                                                    color: AnifColors
                                                                        .grey44)))
                                                      ])
                                                ]))),
                                      );
                                    });
                              }));
                }))
      ]),
    );
  }
}
