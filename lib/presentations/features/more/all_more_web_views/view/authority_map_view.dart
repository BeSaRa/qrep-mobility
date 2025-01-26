import 'package:ebla/app/constants.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AuthorityMapView extends StatelessWidget {
  const AuthorityMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(Constant.latitude, Constant.longitude),
          initialZoom: 17,
        ),
        children: [
          TileLayer(
            urlTemplate: Constant.mapUrlTemplate,
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
    );
  }
}
