import 'package:flutter/material.dart';
import 'package:parivartan_app/pages/home/home_components/table_name.dart';

import '../../../constant.dart';
import 'custome_heading_container.dart';

class DataShowContainer extends StatelessWidget {
  const DataShowContainer({
    super.key,
    this.data,
  });
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultSymetricPeding,
      margin: const EdgeInsets.only(top: 4, left: 4, right: 4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomeHedingContainer(
                aligment: Alignment.centerLeft,
                w: 70,
                title: data['memebr_id'].toString(),
                color: greyColor,
                subColor: Colors.transparent,
              ),
              CustomeHedingContainer(
                aligment: Alignment.center,
                w: 40,
                title: data['sr_no'].toString(),
                color: greyColor,
                subColor: Colors.transparent,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabelName(
                    name: data['English_name'],
                    color: greyColor,
                  ),
                  const SizedBox(height: 2),
                  TabelName(
                    name: data['Marathi_name'],
                    color: greyColor,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomeHedingContainer(
                  subColor: Colors.transparent,
                  color: greyColor,
                  aligment: Alignment.centerRight,
                  w: 45,
                  title: data['branch']['name'].toString(),
                ),

                //  Column(
                //   children: [

                //     // CustomeHedingContainer(
                //     //   subColor: Colors.transparent,
                //     //   color: greyColor,
                //     //   aligment: Alignment.centerRight,
                //     //   w: 45,
                //     //   title: data['Mobile_no'].toString(),
                //     // ),
                //   ],
                // ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
