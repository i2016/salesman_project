import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared.dart';

class CityDropdown extends StatefulWidget {
  @override
  _CityDropdownState createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  List<Map<String, dynamic>> _cities = [];
  Map<String, dynamic>? _selectedCity;

  @override
  void initState() {
    super.initState();
    _fetchCities();
  }

  Future<void> _fetchCities() async {
    try {
      Map<String, String> headers = {
        'lang': LocalizeAndTranslate.getLanguageCode(),
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',
      };
      // Replace with your API endpoint
      final response = await Dio().post(
        baseUrl + getCitiesUrl,
        data: {},
        options: Options(
          headers: headers,
        ),
      );

      final List<dynamic> cities = response.data['result']['result']['cities'];

      setState(() {
        // Extract city names and IDs into a list of maps
        _cities = cities.map((city) {
          return {
            "id": city['id'],
            "name": city['name'],
          };
        }).toList();
      });
    } catch (e) {
      // Handle errors here
      print("Error fetching cities: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "city".tr(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const TextSpan(
                text: ' *',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        DropdownSearch<Map<String, dynamic>>(
          items: _cities,
          itemAsString: (Map<String, dynamic>? city) => city?['name'] ?? '',
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: "choose_city".tr(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          popupProps: PopupProps.menu(
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                hintText: "search_city".tr(),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          onChanged: (Map<String, dynamic>? selectedCity) {
            setState(() {
              _selectedCity = selectedCity;
            });
            Shared.addStoreLocationCity = selectedCity?['id'] ?? 0;
            print(" Shared.addStoreLocationCity : ${ Shared.addStoreLocationCity}");
          },
          selectedItem: _selectedCity,
        ),
      ],
    );
  }
}
