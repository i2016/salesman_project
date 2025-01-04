/*
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrintPage extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  PrintPage(this.data);

  @override
  _PrintPageState createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> _devices = [];
  String _devicesMsg = "";
  final f = NumberFormat("\$###,###.00", "en_US");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {initPrinter()});
  }

  Future<void> initPrinter() async {
    bluetoothPrint.startScan(timeout: Duration(seconds: 2));

    if (!mounted) return;
    bluetoothPrint.scanResults.listen(
      (val) {
        if (!mounted) return;
        setState(() => {_devices = val});
        if (_devices.isEmpty)
          setState(() {
            _devicesMsg = "No Devices";
          });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Printer'),
        backgroundColor: Colors.redAccent,
      ),
      body: _devices.isEmpty
          ? Center(
              child: Text(_devicesMsg ?? ''),
            )
          : ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (c, i) {
                return ListTile(
                  leading: Icon(Icons.print),
                  title: Text(_devices[i].name ?? ''),
                  subtitle: Text(_devices[i].address ?? ''),
                  onTap: () {
                    _startPrint(_devices[i]);
                  },
                );
              },
            ),
    );
  }

  Future<void> _startPrint(BluetoothDevice device) async {
    if (device != null && device.address != null) {
      await bluetoothPrint.connect(device);

      Map<String, dynamic> config = Map();
      List<LineText> list = [];

      list.add(
        LineText(
          type: LineText.TYPE_TEXT,
          content: "Grocery App",
          weight: 2,
          width: 2,
          height: 2,
          align: LineText.ALIGN_CENTER,
          linefeed: 1,
        ),
      );

      for (var i = 0; i < widget.data.length; i++) {
        list.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: widget.data[i]['title'],
            weight: 0,
            align: LineText.ALIGN_LEFT,
            linefeed: 1,
          ),
        );

        list.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content:
                "${f.format(this.widget.data[i]['price'])} x ${this.widget.data[i]['qty']}",
            align: LineText.ALIGN_LEFT,
            linefeed: 1,
          ),
        );
      }
    }
  }
}
*/

// import 'package:bluetooth_print/bluetooth_print.dart';
// import 'package:bluetooth_print/bluetooth_print_model.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';

// class PrintPage extends StatefulWidget {
//   final List<Map<String, dynamic>> data;
//   PrintPage(this.data);

//   @override
//   _PrintPageState createState() => _PrintPageState();
// }

// class _PrintPageState extends State<PrintPage> {
//   BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
//   List<BluetoothDevice> _devices = [];
//   String _devicesMsg = "";
//   final f = NumberFormat("\$###,###.00", "en_US");

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) => {initPrinter()});
//   }

//   Future<void> initPrinter() async {
//     bluetoothPrint.startScan(timeout: Duration(seconds: 2));

//     if (!mounted) return;
//     bluetoothPrint.scanResults.listen((val) {
//       if (!mounted) return;
//       setState(() {
//         _devices = val;
//       });
//       if (_devices.isEmpty) {
//         setState(() {
//           _devicesMsg = "No Devices Found";
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Printer'),
//         backgroundColor: Colors.redAccent,
//       ),
//       body: _devices.isEmpty
//           ? Center(
//         child: Text(_devicesMsg),
//       )
//           : ListView.builder(
//         itemCount: _devices.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Icon(Icons.print),
//             title: Text(_devices[index].name ?? ''),
//             subtitle: Column(children: [
//               Text(_devices[index].address ?? ''),
//               Text(_devices[index].connected.toString() ?? '')
//             ],),

//             onTap: () {
//               _startPrint(_devices[index]);
//             },
//           );
//         },
//       ),
//     );
//   }

//   Future<void> _startPrint(BluetoothDevice device) async {
//     if (device != null && device.address != null) {
//       try {
//         // Attempt to connect to the device
//         bool isConnected = await bluetoothPrint.connect(device);

//         if (isConnected) {
//           Map<String, dynamic> config = {};
//           List<LineText> list = [];

//           list.add(
//             LineText(
//               type: LineText.TYPE_TEXT,
//               content: "Grocery App",
//               weight: 2,
//               width: 2,
//               height: 2,
//               align: LineText.ALIGN_CENTER,
//               linefeed: 1,
//             ),
//           );

//           for (var i = 0; i < widget.data.length; i++) {
//             list.add(
//               LineText(
//                 type: LineText.TYPE_TEXT,
//                 content: widget.data[i]['title'],
//                 weight: 0,
//                 align: LineText.ALIGN_LEFT,
//                 linefeed: 1,
//               ),
//             );

//             list.add(
//               LineText(
//                 type: LineText.TYPE_TEXT,
//                 content:
//                 "${f.format(widget.data[i]['price'])} x ${widget.data[i]['qty']}",
//                 align: LineText.ALIGN_LEFT,
//                 linefeed: 1,
//               ),
//             );
//           }

//           list.add(
//             LineText(
//               type: LineText.TYPE_TEXT,
//               content: "Thank you for shopping!",
//               align: LineText.ALIGN_CENTER,
//               linefeed: 1,
//             ),
//           );

//           await bluetoothPrint.printReceipt(config, list).catchError((error){
//             print("error%% : $error ");
//           }).then((value){
//             print("value : ${value}");
//             if(value == true){
//               Fluttertoast.showToast(
//                 msg: "Print Successful",
//                 toastLength: Toast.LENGTH_SHORT,
//                 gravity: ToastGravity.BOTTOM,
//               );
//             }else{
//               Fluttertoast.showToast(
//                 msg: "Print faield",
//                 toastLength: Toast.LENGTH_SHORT,
//                 gravity: ToastGravity.BOTTOM,
//               );
//             }
//           });



//           // Disconnect after printing
//           await bluetoothPrint.disconnect();
//         } else {
//           Fluttertoast.showToast(
//             msg: "Failed to Connect to Printer",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//           );
//         }
//       } catch (e) {
//         print("e## : ${e}");
//         Fluttertoast.showToast(
//           msg: "Error: $e",
//           toastLength: Toast.LENGTH_LONG,
//           gravity: ToastGravity.BOTTOM,
//         );
//       }
//     } else {
//       Fluttertoast.showToast(
//         msg: "Invalid Device Selected",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//       );
//     }
//   }
// }
