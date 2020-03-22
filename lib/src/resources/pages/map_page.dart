import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icab/src/commons/configs.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:icab/src/resources/widgets/ride_picker.dart';
import 'package:icab/src/resources/widgets/ride_picker_2.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static final CameraPosition _initCameraPos = CameraPosition(
    target: LatLng(10.7774749, 106.6942503),
    zoom: 14.4746,
  );

  GoogleMapController mapController;
  String _mapStyle;

  @override
  void initState() {
    rootBundle
        .loadString('assets/map_style.txt')
        .then((data) => _mapStyle = data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: _initCameraPos,
            onMapCreated: (controller){
              mapController = controller;
              mapController.setMapStyle(_mapStyle);
            },
          ),
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
                  RidePicker2(),
                ],
              )),
        ],
      ),
    );
  }
}
