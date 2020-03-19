import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icab/src/commons/configs.dart';
import 'package:icab/src/commons/res/icab_colors.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static final CameraPosition _initCameraPos = CameraPosition(
    target: LatLng(10.7774749, 106.6942503),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(initialCameraPosition: _initCameraPos),
          Positioned(
              left: 0,
              right: 0,
              child: Column(
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: FlatButton(
                      onPressed: () {},
                      child: SvgPicture.asset(
                        'images/ic_menu.svg',
                        width: 24,
                      ),
                    ),
                    title: Text(
                      'iCab',
                      style: TextStyle(
                          fontSize: Configs.textSizeSubTitle,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    actions: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16),
                        child: SvgPicture.asset(
                          'images/ic_notification.svg',
                          width: 24,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 3),
                            blurRadius: 4
                          ),
                        ]),
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: FlatButton(
                      onPressed: () {},
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: <Widget>[
                          Positioned(
                            left: 0,
                            child: SvgPicture.asset(
                              'images/ic_map_pointer.svg',
                              width: 14,
                            ),
                          ),
                          Positioned(
                            left: 20,
                            right: 16,
                            child: Text(
                              '147 Đinh Bộ Lĩnh, phường 26, quận Bình Thạnh, TP.HCM',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: ICabColors.grey,
                                fontSize: Configs.textSizeHint,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}