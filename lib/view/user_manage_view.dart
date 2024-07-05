
import 'package:flutter/material.dart';

class UserManageView extends StatefulWidget {
  const UserManageView({super.key});

  @override
  State<StatefulWidget> createState() => _UserManageViewState();
}

class _UserManageViewState extends State<UserManageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}