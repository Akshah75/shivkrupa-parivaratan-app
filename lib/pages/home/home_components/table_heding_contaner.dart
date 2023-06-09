import 'package:flutter/material.dart';
import 'package:parivartan_app/pages/home/home_components/table_name.dart';

import '../../../constant.dart';
import 'custome_heading_container.dart';

class TableHedingOfHomepage extends StatelessWidget {
  const TableHedingOfHomepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultSymetricPeding,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      // height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomeHedingContainer(
            aligment: Alignment.centerLeft,
            w: 65,
            title: 'Member id',
          ),
          const SizedBox(width: 15),
          Container(
            alignment: Alignment.centerLeft,
            width: 50,
            child: const TabelName(
              name: 'Sr no ',
              color: whiteColor,
            ),
          ),
          const SizedBox(width: 25),
          const CustomeHedingContainer(
            w: 50,
            title: 'Name',
          ),
          const SizedBox(width: 108),
          const TabelName(
            name: 'Branch',
            color: whiteColor,
          ),
        ],
      ),
    );
  }
}
