import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:water/Visits/data/models/product_model.dart';

class CustomUnitsDropdown extends StatefulWidget {
  final String? title;
  final double? width;
  final double? height;
  final List<UomIds>? units;
  final Function(UomIds)? onUnitSelected;
  CustomUnitsDropdown({this.title,this.width,this.height,this.units,this.onUnitSelected});
  @override
  _CustomUnitsDropdownState createState() => _CustomUnitsDropdownState();
}

class _CustomUnitsDropdownState extends State<CustomUnitsDropdown> {
  UomIds? _selectedUnitId;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            widget.title ??'',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff758195),
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        items: widget.units
            ?.map((item) => DropdownMenuItem<UomIds>(
          value: item,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              item.name!,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xff758195),
              ),
            ),
          ),
        ))
            .toList(),
        value: _selectedUnitId,
        onChanged: (value) {
          setState(() {
            _selectedUnitId = value as UomIds? ;
          });
          widget.onUnitSelected!.call(_selectedUnitId!);
        },
        buttonStyleData: ButtonStyleData(
          height: widget.height ,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
            color: Colors.white,
          ),
        ),
        iconStyleData: IconStyleData(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xff758195),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
