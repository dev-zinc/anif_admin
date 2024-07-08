
import 'package:anif_admin/domain/notification.dart' as domain;
import 'package:anif_admin/lib/notification_type.dart';
import 'package:anif_admin/lib/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

import 'package:anif_admin/lib/colors.dart';

class NotificationsView extends StatefulWidget {

  const NotificationsView({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final domain.NotificationViewModel _notificationViewModel = domain.NotificationViewModel();
  NotificationType? _selectedType;

  void _onBackArrowPressed() {
    Navigator.pop(context);
  }

  void _onDropdownSelected(NotificationType? value) {
    setState(() => _selectedType = value);
  }

  void _onTapNotification(domain.Notification notification) {
    if(!notification.isRead) {
      setState(() => notification.read());
    }


  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final List<domain.Notification> notifications;

    if(_selectedType == null) {
      setState(() => _selectedType = NotificationType.values.first);
    }
    notifications = _notificationViewModel.notifications
        .where((notification) => notification.notificationTypes.contains(_selectedType))
        .toList();

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
                  child: Icon(Icons.arrow_drop_down, size: 20)
              ),
              items: NotificationType.values.map((type) => DropdownMenuItem<NotificationType>(
                value: type,
                child: Text(
                  type.displayName,
                  style: const TextStyle(
                      fontSize: 12,
                      color: AnifColors.grey44,
                      fontWeight: FontWeight.w500,
                  ),
                ),
              )).toList(),
            )
          ),
          SizedBox(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height - 100,
            child: Container(
              child: notifications.isEmpty
                ? const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "알림이 없습니다.",
                    style: TextStyle(
                        fontSize: 30,
                        color: AnifColors.greyAA,
                    )
                  )
                )
                : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: notifications.length,
                  itemBuilder: (BuildContext context, int index) {
                    var notification = notifications[index];
                    return Container(
                      width: mediaQuery.size.width,
                      // height: 70,
                      color: notification.isRead ? AnifColors.greyDD : AnifColors.greyF2,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: InkWell(
                          onTap: () => _onTapNotification(notification),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      FutureBuilder(
                                        future: notification.user.createHeadImage(24),
                                        builder: (context, snapshot) {
                                          final loadingBox = Container(
                                              width: 24,
                                              height: 24,
                                              color: AnifColors.grey44
                                          );
                                          if(snapshot.connectionState != ConnectionState.done) {
                                            return loadingBox;
                                          }
                                          return snapshot.hasData ? snapshot.data! : loadingBox;
                                        }
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 6),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          notification.title,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: AnifColors.grey44,
                                          )
                                        )
                                      )
                                    ]
                                  ),
                                  Text(
                                    formatDuration(notification.computePassedTime()),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: AnifColors.grey44,
                                    )
                                  )
                                ]
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: notification.notificationTypes.map((type) {
                                      return Container(
                                        margin: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                          color: AnifColors.greyF2,
                                          border: Border.all(
                                              color: AnifColors.greyAA,
                                              width: 2
                                          ),
                                          borderRadius: BorderRadius.circular(90)
                                        ),
                                        child: Text(
                                          type.displayName,
                                          softWrap: true,
                                          style: const TextStyle(
                                              fontSize: 9,
                                              color: AnifColors.grey66,
                                              fontWeight: FontWeight.bold
                                          )
                                        ),
                                      );
                                    }).toList()
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      notification.isRead ? "읽음" : "",
                                      style: const TextStyle(
                                          fontSize: 9,
                                          color: AnifColors.grey44
                                      )
                                    )
                                  )
                                ]
                              )
                            ]
                          )
                        )
                      ),
                    );
                  })
            )
          )
        ]
      ),
    );
  }
}