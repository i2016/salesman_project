import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapContainer extends StatefulWidget{
  final String? address;
   GoogleMapContainer({super.key,this.address });

  @override
  State<GoogleMapContainer> createState() => _GoogleMapContainerState();
}

class _GoogleMapContainerState extends State<GoogleMapContainer> {

var myMarkers = HashSet<Marker>();
BitmapDescriptor? customMarker;

  @override
  Widget build(BuildContext context) {
    return Container(
            width: double.infinity,
            height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.27
                            : MediaQuery.of(context).size.height * 0.38,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child:  Column(
              children: [
                 Expanded(
                  flex: 5,
                  child: GoogleMap(
                    mapType: MapType.terrain,
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(
                          30.0444,
                          31.2357,
                        ),
                        zoom: 14
                        ),
                        onMapCreated: (GoogleMapController googleMapController){
        setState(() {
                  myMarkers.add(
                    const Marker(
                      markerId: MarkerId('1'),
                    draggable: true,
                  position: LatLng(37.43296265331129, -122.08832357078792),
                  icon: BitmapDescriptor.defaultMarker
                  ));
                });
      },
               markers: myMarkers,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'العنوان',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.006,
                                ),
                               Container(
                                    width:  MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.width * 0.135
                              : MediaQuery.of(context).size.width * 0.14,
                                    height:  MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.019
                              : MediaQuery.of(context).size.height * 0.032,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 243, 243, 244),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Row(
                                children: [
                                Image.asset(
                                  'assets/images/IconLine.png',
                                  color: const Color(0xff1D6E4F),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.004,
                                ),
                                const Text(
                                  'يبعد 232 ك.م',
                                  style: TextStyle(
                                      color: Color(0xff1D6E4F),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ],
                              ),
                      Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          'assets/images/Map.png',
                          height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.035
                            : MediaQuery.of(context).size.height * 0.052,
                        ),
                      ),
                            ],
                          ),
                          Row(
                            children: [
                              Opacity(
                                opacity: 0.9,
                                child: Image.asset(
                                  'assets/images/markk.png'
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.007,
                              ),
                              Opacity(
                                opacity: 0.9,
                                child: Container(
                                  width:   MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                                               widget.address != null ? widget.address!
                                                               :'١٢٣٤٥ طريق الملك فهد، حي العليا،',
                                    style: TextStyle(
                                      color: Color(0xff25292E),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                      
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ),
              ],
            )
            );
}
}