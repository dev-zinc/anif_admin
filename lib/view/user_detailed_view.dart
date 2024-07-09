
import 'package:anif_admin/domain/user.dart';
import 'package:anif_admin/lib/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          Text(user.name),
          Container(
            margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              color: AnifColors.greyE3,
              boxShadow: [
                BoxShadow(
                  color: AnifColors.shadow,
                ),
                BoxShadow(
                  color: AnifColors.shadow,
                  spreadRadius: -12,
                  blurRadius: 12
                )
              ]
            ),
            child: const Icon(
              Icons.arrow_back,
              color: AnifColors.grey44,
              shadows: [
                Shadow(
                   color: AnifColors.shadow,
                   offset: Offset(0, 2),
                   blurRadius: 4
                )
              ],
            )
          )
        ],
      ),
    );
  }
}