// Import necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/cubit/google_map/google_map_cubit.dart';

// GmapPage is a StatefulWidget that displays a Google Map with markers.
class GmapPage extends StatefulWidget {
  final double lat; // Latitude of the initial marker.
  final double long; // Longitude of the initial marker.

  const GmapPage({
    Key? key,
    required this.lat,
    required this.long,
  }) : super(key: key);

  @override
  State<GmapPage> createState() => _GmapPageState();
}

class _GmapPageState extends State<GmapPage> {
  // Controller for the address text field.
  final TextEditingController addressController = TextEditingController();

  // GoogleMapController to interact with the map.
  late GoogleMapController _mapController;

  // Set to hold markers on the map.
  final Set<Marker> _markers = {};

  // Function to create an initial marker at the specified latitude and longitude.
  void _createInitialMarker() {
    final marker = Marker(
      markerId: const MarkerId("position"),
      position: LatLng(widget.lat, widget.long),
    );

    _markers.add(marker);
  }

  // Function to set a new marker on the map.
  void setNewMarker({required double lat, required double long}) async {
    _markers.clear();
    final marker = Marker(
      markerId: const MarkerId("position"),
      position: LatLng(lat, long),
    );

    _markers.add(marker);

    // Animate the camera to the new marker's position.
    _mapController.animateCamera(
      CameraUpdate.newLatLngZoom(LatLng(lat, long), 15),
    );

    // Update the location using a BLoC (Business Logic Component) state management approach.
    context.read<GoogleMapCubit>().getMarkLocation(lat: lat, long: long);

    setState(() {});
  }

  // Function to set the GoogleMapController when it is created.
  void mapController(GoogleMapController value) {
    _mapController = value;
  }

  @override
  void initState() {
    // Create the initial marker when the widget is initialized.
    _createInitialMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganti Lokasi'),
        backgroundColor: Colors.amber[900], // AppBar title.
        automaticallyImplyLeading: false,
        actions: [
          // Action button to close the page and return to the previous screen.
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.check_box),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Stack(
        children: [
          // GoogleMap widget to display the map and markers.
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target:
                  LatLng(widget.lat, widget.long), // Initial camera position.
            ),
            markers: _markers, // Set of markers to display on the map.
            onMapCreated: (controller) {
              mapController(
                  controller); // Set the map controller when it's created.
            },
            onTap: (argument) {
              // When the user taps on the map, set a new marker at the tapped location.
              setNewMarker(
                lat: argument.latitude,
                long: argument.longitude,
              );
            },
          ),
          // BlocBuilder to handle the state from the GoogleMapCubit.
          BlocBuilder<GoogleMapCubit, GoogleMapState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const Text(
                    'No Address'), // Default text when no address is available.
                loaded: (model) {
                  return Text(
                      model.address ?? ''); // Display the loaded address.
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
