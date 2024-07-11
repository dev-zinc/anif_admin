
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

import 'colors.dart';

Widget createPopableHeader({required BuildContext context, required String title}) {
  return Container(
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
                onPressed: () => Navigator.pop(context),
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
              child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18,
                      color: AnifColors.grey44,
                      fontWeight: FontWeight.w500
                  )
              )
          )
        ]
    ),
  );
}
