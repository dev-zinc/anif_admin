

import 'package:anif_admin/domain/user.dart';
import 'package:flutter/material.dart';

const String _url = 'https://mineskin.eu/helm/';

Future<Image> createImage(User user, int size) async {
  return Image.network('$_url/${user.name}/$size.png');
}