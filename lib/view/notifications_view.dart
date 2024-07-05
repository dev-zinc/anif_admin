
import 'package:flutter/material.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationsViewState();

}

class _NotificationsViewState extends State<NotificationsView> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Icon(
            Icons.access_alarm,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}