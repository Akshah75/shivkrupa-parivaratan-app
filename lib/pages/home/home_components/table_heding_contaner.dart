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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 50,
              child: const TabelName(
                name: 'मतदार क्',
                color: whiteColor,
              ),
            ),
            const SizedBox(width: 20),
            const CustomeHedingContainer(
              aligment: Alignment.centerLeft,
              w: 65,
              title: 'सभासद क्',
            ),
            const SizedBox(width: 20),
            const CustomeHedingContainer(
              w: 50,
              title: 'नाव',
            ),
            const SizedBox(width: 100),
            const CustomeHedingContainer(
              aligment: Alignment.centerLeft,
              w: 65,
              title: 'मोबाइल न',
            ),
            const SizedBox(width: 20),
            const CustomeHedingContainer(
              aligment: Alignment.centerLeft,
              w: 65,
              title: 'पॅन क्र',
            ),
            const SizedBox(width: 20),
            const CustomeHedingContainer(
              aligment: Alignment.centerLeft,
              w: 65,
              title: 'आधार क्र',
            ),
          ],
        ),
      ),
    );
  }
}
