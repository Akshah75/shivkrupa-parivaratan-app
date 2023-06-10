import 'package:flutter/material.dart';

import '../../../constant.dart';

class HomeCircularProgressContainer extends StatelessWidget {
  const HomeCircularProgressContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: const BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: const Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}

class NoDataFoundContainer extends StatelessWidget {
  const NoDataFoundContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(noDataFound),
            const Text("No Data Found!Search Your Data")
          ]),
        ),
      ),
    );
  }
}
