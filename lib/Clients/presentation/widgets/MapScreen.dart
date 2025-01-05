import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController; // Make this nullable
  LatLng? _selectedLocation;
  Location _location = Location();
  LatLng _initialLocation = LatLng(37.7749, -122.4194); // Default location (San Francisco)
  bool _isLocationLoaded = false;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location services are enabled
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return;
    }

    // Check location permissions
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    // Get the current location
    final userLocation = await _location.getLocation();
    setState(() {
      _initialLocation = LatLng(userLocation.latitude!, userLocation.longitude!);
      _isLocationLoaded = true;
    });

    // Safely move camera to the current location if the map is already initialized
    if (_mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLng(_initialLocation),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Store Location'),
      ),
      body: _isLocationLoaded
          ? Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialLocation,
              zoom: 14,
            ),
            onMapCreated: (controller) {
              _mapController = controller;

              // Move camera to the current location when the map is ready
              if (_isLocationLoaded) {
                _mapController!.animateCamera(
                  CameraUpdate.newLatLng(_initialLocation),
                );
              }
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onTap: (position) {
              setState(() {
                _selectedLocation = position;
              });
            },
            markers: _selectedLocation != null
                ? {
              Marker(
                markerId: MarkerId('selected-location'),
                position: _selectedLocation!,
              ),
            }
                : {},
          ),
          if (_selectedLocation != null)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedLocation != null) {
                    Navigator.pop(context, _selectedLocation);
                  }
                },
                child: Text('Confirm Location'),
              ),
            ),
        ],
      )
          : Center(child: CircularProgressIndicator()), // Show loader until location is ready
    );
  }
}
