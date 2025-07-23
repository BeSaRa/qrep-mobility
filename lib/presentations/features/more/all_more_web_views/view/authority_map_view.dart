import 'dart:developer';

import 'package:ebla/app/constants.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthorityMapView extends StatelessWidget {
  const AuthorityMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          String googleMapsUrl = Constant.googleMapUrlTemplate;
          if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
            await launchUrl(Uri.parse(googleMapsUrl),
                mode: LaunchMode.externalApplication);
          } else {
            log('Could not open Google Maps');
          }
        },
        label: Text(
          AppStrings().seeOnGoogleMap,
          style: TextStyle(color: ColorManager.white),
        ),
        icon: Icon(Icons.map_rounded, color: ColorManager.white),
        backgroundColor: ColorManager.primary,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.transparent],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset(
            ImageAssets.appbarBg,
            fit: BoxFit.fill,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.maybePop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: ColorManager.cloudyGrey,
                  ),
                  SizedBox(width: AppSizeW.s5),
                  Text(
                    AppStrings().main,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            Text(
              AppStrings().authorityLocation,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(Constant.latitude, Constant.longitude),
              initialZoom: 17,
            ),
            children: [
              TileLayer(
                // urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                urlTemplate: Constant.mapUrlTemplate,
                userAgentPackageName: 'com.eblacorp.qrep',
                subdomains:const ['a', 'b', 'c', 'd'],
                tileBuilder: Theme.of(context).brightness == Brightness.dark
                    ? customDarkModeTileBuilder
                    : null,
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: const LatLng(Constant.latitude, Constant.longitude),
                    child: Icon(Icons.location_on_sharp,
                        color: const Color(0xffEA4335), size: AppSizeW.s40),
                  ),
                ],
              ),
            ],
          ),
        //Zak NOOOOOTE: u Must delete this 
        //but i add it because i want to not block the app by the OpenStreetMap contributors
        Positioned(
  bottom: 8,
  right: 8,
  child: Container(
    color: Colors.black.withOpacity(0.5),
    padding: const EdgeInsets.all(4),
    child: const Text(
      textDirection: TextDirection.ltr,
      'OpenStreetMap contributors © | Carto © ',
      style: TextStyle(color: Colors.white, fontSize: 10),
    ),
  ),
)
        ],
      ),
    );
  }
}

Widget customDarkModeTileBuilder(
  BuildContext context,
  Widget tileWidget,
  TileImage tile,
) {
  return ColorFiltered(
    colorFilter: const ColorFilter.matrix(<double>[
      -0.2126, -0.7152, -0.0722, 0, 255, // Red channel
      -0.2126, -0.7152, -0.0722, 0, 255, // Green channel
      -0.2126, -0.7152, -0.0722, 0, 255, // Blue channel
      0, 0, 0, 1, 0, // Alpha channel
    ]),
    child: tileWidget,
  );
}