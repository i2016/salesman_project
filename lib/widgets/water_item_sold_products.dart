import 'package:flutter/material.dart';

class WaterItemSoldProducts extends StatelessWidget{
  const WaterItemSoldProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.045,
              decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/IMGggg.png')
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.015,
                    ),
                    const Expanded(
                    flex: 1,
                    child: Text(
                      '33',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                     Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'مياه',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        const Text(
                          'مياه مدينة شرنك 15 حبة  600 مل',
                        maxLines: 4,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ],
                    ),
                    ),
                    const Expanded(
                    flex: 1,
                    child: Text(
                      '42 ر.س',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                ],
              ),
      ),
    );
}
}