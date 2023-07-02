// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/cubit/google_map/google_map_cubit.dart';
// import 'package:location/location.dart';

import 'package:restaurant/data/models/responses/add_product/add_product_response_model.dart';
import 'package:restaurant/presentation/pages/detail_map_page.dart';

class DetailRestaurantPage extends StatefulWidget {
  final Restaurant data;
  const DetailRestaurantPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<DetailRestaurantPage> createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final Set<Marker> markers = {};
    LatLng? posisitionDestination;
    void createMarker(double lat, double lng, String address) {
      final marker = Marker(
          markerId: const MarkerId('currentPosition'),
          infoWindow: InfoWindow(title: address),
          position: LatLng(lat, lng));

      markers.add(marker);
    }

    // Future<bool> _getPermission(Location location) async {
    //   late bool serviceEnabled;
    //   late PermissionStatus permissionGranted;

    //   serviceEnabled = await location.serviceEnabled();
    //   if (!serviceEnabled) {
    //     serviceEnabled = await location.requestService();
    //     if (!serviceEnabled) {
    //       return false;
    //     }
    //   }

    //   permissionGranted = await location.hasPermission();
    //   if (permissionGranted == PermissionStatus.denied) {
    //     permissionGranted = await location.requestPermission();
    //     if (permissionGranted != PermissionStatus.granted) {
    //       return false;
    //     }
    //   }

    //   return true;
    // }

    final lat = double.parse(widget.data.attributes.latitude);
    final lng = double.parse(widget.data.attributes.longitude);
    posisitionDestination = LatLng(lat, lng);
    createMarker(lat, lng, widget.data.attributes.address);

    Widget image() {
      return Container(
        width: double.infinity,
        height: height * 0.4,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.data.attributes.photo),
              fit: BoxFit.cover),
        ),
      );
    }

    Widget description() {
      return Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.amber[50], borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Description",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              widget.data.attributes.description,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      );
    }

    Widget name() {
      return Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.amber[50], borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Name",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              widget.data.attributes.name,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      );
    }

    Widget address() {
      return Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.amber[50], borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Address",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              widget.data.attributes.description,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      );
    }

    Widget map() {
      return Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(10),
        height: 200,
        child: BlocBuilder<GoogleMapCubit, GoogleMapState>(
            builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return GoogleMap(
                mapType: MapType.normal,
                markers: markers,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    lat,
                    lng,
                  ),
                  zoom: 15,
                ),
              );
            },
            loaded: (model) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailMapPage(
                            origin: model.latLng!,
                            destination: posisitionDestination!);
                      },
                    ),
                  );
                },
                child: GoogleMap(
                  mapType: MapType.normal,
                  markers: markers,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      lat,
                      lng,
                    ),
                    zoom: 15,
                  ),
                ),
              );
            },
          );
        }),
      );
    }

    Widget list() {
      return Container(
          height: height * 0.7,
          width: double.infinity,
          margin: EdgeInsets.only(top: height * 0.35),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(9), topRight: Radius.circular(20))),
          child: ListView(
            children: [name(), description(), address(), map()],
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Restaurant'),
        backgroundColor: Colors.amber[900],
      ),
      // body: ListView(
      //   children: [
      //     Image.network(data.attributes.photo),
      //     const SizedBox(
      //       height: 16,
      //     ),
      //     Text(data.attributes.name),
      //     const SizedBox(
      //       height: 16,
      //     ),
      //     Text(data.attributes.description),
      //     const SizedBox(
      //       height: 16,
      //     ),
      //     Text(data.attributes.address),
      //     const SizedBox(
      //       height: 16,
      //     ),
      //     SizedBox(
      //       height: 200,
      //       child: GoogleMap(
      //         mapType: MapType.normal,
      //         markers: markers,
      //         initialCameraPosition: CameraPosition(
      //           target: LatLng(
      //             lat,
      //             lng,
      //           ),
      //           zoom: 15,
      //         ),
      //       ),
      //     ),
      //   ],
      // )
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [image(), list()],
        ),
      ),
    );
  }
}
