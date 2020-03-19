import 'dart:convert';

import 'package:flutter/material.dart';

class Utils {
  static loadJson(BuildContext context, String assetName) async {
    String data = await DefaultAssetBundle.of(context).loadString(assetName);
    return json.decode(data);
  }
}
