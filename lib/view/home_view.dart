
import 'package:anif_admin/lib/colors.dart';
import 'package:anif_admin/lib/notification_type.dart';
import 'package:anif_admin/view/notifications_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _hasNewNotifications = true;
  final _notificationCounter = NotificationCounter();

  void useCounter(Function(NotificationCounter counter) consumer) {
    setState(() => consumer(_notificationCounter));
  }

  void _onNotificationPressed() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotificationsView())
    );
    if(_hasNewNotifications) {
      setState(() => _hasNewNotifications = false);
    }
  }

  Widget _createNotificationsButtonContainer() {
    return Container(
      height: 60,
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.bottomRight,
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            IconButton(
              onPressed: _onNotificationPressed,
              icon: const Icon(
                  Icons.notifications_none_outlined,
                  size: 40
              ),
            ),
            Visibility(
              visible: _hasNewNotifications,
              child: Container(
                margin: const EdgeInsets.all(5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: AnifColors.red,
                  borderRadius: BorderRadius.circular(90),
                  boxShadow: const [
                    BoxShadow(
                        color: AnifColors.shadow,
                        blurRadius: 4,
                        offset: Offset(4, 4)
                    )
                  ],
                ),
              )
            )
          ]
        ),
      ),
    );
  }

  Widget _createBriefNotifications() {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상단 전체 개수
          Container(
            width: 90,
            height: 35,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AnifColors.greyF2,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AnifBlueColors.blueStroke, width: 3),
              boxShadow: const [
                BoxShadow(
                    color: AnifColors.shadow,
                    blurRadius: 4,
                    offset: Offset(4, 4)
                )
              ],
            ),
            alignment: Alignment.center,
            child: Text(
                "미해결 ${_notificationCounter.total()}",
                style: const TextStyle(
                    color: AnifBlueColors.blueText,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
          // 각 항목별 개수
          Container(
            width: mediaQuery.size.width * 0.8,
            height: 184,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: AnifColors.shadow,
                    blurRadius: 4,
                    offset: Offset(4, 4)
                )
              ],
              color: AnifColors.greyF2,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18),
                  bottomRight: Radius.circular(18)
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 3, bottom: 3, right: 20),
              child: Column(
                children: NotificationType.values.map((type) => Container(
                  margin: const EdgeInsets.only(top: 3, bottom: 3),
                  // alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        type.displayName,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: AnifColors.grey44,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "${_notificationCounter.get(type)}",
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            color: AnifColors.grey44,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]
                  )
                )).toList(),
              )
            ),
          ),
        ]
      )
    );
  }

  Widget _createMoniteringWidget() {
    final mediaQuery = MediaQuery.of(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 10, right: 10, top: 50),
        width: mediaQuery.size.width * 0.9,
        height: 200,
        decoration: const BoxDecoration(
            color: AnifColors.greyF2,
            borderRadius: BorderRadius.all(Radius.circular(18)),
            boxShadow: [
              BoxShadow(
                  color: AnifColors.shadow,
                  blurRadius: 4,
                  offset: Offset(4, 4)
              )
            ]
        ),
        child: Container()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AnifColors.greyF2,
        child: Column(
          children: <Widget>[
            _createNotificationsButtonContainer(),
            _createBriefNotifications(),
            _createMoniteringWidget()
          ],
        )
      );
  }
}