
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';
import 'package:water/zebra/presentation/bloc/zebra_bloc.dart';
import 'package:water/zebra/presentation/widgets/receipt.dart';

class ZebraPrintScreen extends StatefulWidget {
  InvoiceData? invoiceData;
  ZebraPrintScreen({this.invoiceData});
  @override
  _ZebraPrintScreenState createState() => _ZebraPrintScreenState();
}

class _ZebraPrintScreenState extends State<ZebraPrintScreen> {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  List<BluetoothDevice> _devices = [];
  BluetoothDevice? _device;
  bool _connected = false;
  String? pathImage;
  Receipt? receipt;

  @override
  void initState() {
    super.initState();
    //  zebraBloc.add(GetZebraReceiptEvent());
    initPlatformState();
    // initSavetoPath();
    receipt = Receipt();
  }

  Future<void> initPlatformState() async {
    bool? isConnected = await bluetooth.isConnected;
    List<BluetoothDevice> devices = [];
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      print("error-------");
    }

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          setState(() {
            _connected = true;
          });
          break;
        case BlueThermalPrinter.DISCONNECTED:
          setState(() {
            _connected = false;
          });
          break;
        default:
          print(state);
          break;
      }
    });

    if (!mounted) return;
    setState(() {
      _devices = devices;
    });

    if (isConnected!) {
      setState(() {
        _connected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kBlueColor,

          title: Text(
            "طباعة الأيصال",
            style: TextStyle(color: kBlackColor),
          ),
        ),
        body: Container(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:Shared.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Device : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: DropdownButton(
                        items: _getDeviceItems(),
                        onChanged: (value) => setState(() => _device = value),
                        value: _device,
                        iconSize: 25,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        elevation: 15,
                      ),
                      onPressed: () {
                        initPlatformState();
                      },
                      child: Text(
                        'Refresh',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _connected
                            ? Colors.red
                            : Colors.deepPurple, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        elevation: 15,
                      ),
                      onPressed: _connected ? _disconnect : _connect,
                      child: Text(
                        _connected ? 'Disconnect' : 'Connect',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      elevation: 15,
                    ),
                    onPressed: () {
                      print("1");
                      receipt!.sample(invoiceData: widget.invoiceData);
                    },
                    child: Text(
                      'PRINT',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

/*
BlocBuilder<ZebraBloc, AppState>(
            bloc: zebraBloc,
            builder: (context, state) {
              if (state is Loading) {
                return const LoadingPlaceHolder(
                  shimmerType: ShimmerType.list,
                  cellShimmerHeight: 50,
                  shimmerCount: 10,
                );
              }
              else if (state is GetZebraReceiptDone) {
                if(state.recieptModel != null ) {
                  return   Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Device : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: DropdownButton(
                                  items: _getDeviceItems(),
                                  onChanged: (value) => setState(() => _device = value),
                                  value: _device,
                                  iconSize: 25,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),

                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueAccent, // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                  elevation: 15,
                                ),
                                onPressed: () {
                                  initPlatformState();
                                },
                                child: Text(
                                  'Refresh',
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _connected ? Colors.red : Colors.deepPurple, // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                  elevation: 15,
                                ),
                                onPressed: _connected ? _disconnect : _connect,
                                child: Text(
                                  _connected ? 'Disconnect' : 'Connect',
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange, // Background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                elevation: 15,
                              ),
                              onPressed: () {
                                print("1");
                                receipt!.sample(
                                    invoiceData: widget.invoiceData
                                );
                                //  Navigator.pushNamed(context, "MainMenuScreen");
                              },
                              child: Text(
                                'PRINT',
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                }
                else{
                  return Center(
                    child: Text("لا توجد بيانات حاليا"),
                  );
                }

              }
              else if (state is GetZebraReceiptErrorLoading) {
                return Center(
                  child: Text("${state.message}"),
                );
              } else {
                return Container();
              }

            },
          )
*/


        );
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devices.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      _devices.forEach((device) {
        items.add(DropdownMenuItem(
          child: Text(device.name!),
          value: device,
        ));
      });
    }
    return items;
  }

  void _connect() {
    if (_device == null) {
      print("##_device : ${_device}");
      show('No device selected.');
    } else {
      bluetooth.isConnected.then((isConnected) {
        print("##isConnected : ${isConnected}");
        if (!isConnected!) {
          bluetooth.connect(_device!).catchError((error) {
            print("##isConnected error : $error");
            setState(() => _connected = false);

          });
          setState(() => _connected = true);
        }
      });
    }
  }

  void _disconnect() {
    bluetooth.disconnect();
    setState(() => _connected = true);
  }

  Future show(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) async {
    await new Future.delayed(new Duration(milliseconds: 100));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        duration: duration,
      ),
    );
  }
}

