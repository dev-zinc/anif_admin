

import 'package:flutter/material.dart';

import '../model/user/user.dart';
import 'colors.dart';

const String _url = 'https://mineskin.eu/helm/';

Future<Image> createImage(User user, int size) async {
  return Image.network('$_url/${user.name}/$size.png');
}

Widget Function(BuildContext, AsyncSnapshot<Widget>) getLoadingBoxBuilder({required int size}) {
  return (context, snapshot) {
    final loadingBox = Container(
        width: size.toDouble(),
        height: size.toDouble(),
        color: AnifColors.grey44
    );
    if(snapshot.connectionState != ConnectionState.done) {
      return loadingBox;
    }
    return snapshot.hasData ? snapshot.data! : loadingBox;
  };
}