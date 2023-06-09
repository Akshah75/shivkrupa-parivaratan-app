import 'package:flutter/material.dart';
import 'package:parivartan_app/pages/home/home_components/show_alert_dialog.dart';
import 'package:parivartan_app/provider/login_provider.dart';
import 'package:parivartan_app/provider/search_provider.dart';
import '../../../constant.dart';
import 'package:to_csv/to_csv.dart' as export_csv;

import '../../splash/splash_page.dart';

AppBar appBar(SearchProvider searchProvider, LoginProvider loginDataProvider,
    BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    automaticallyImplyLeading: false,
    elevation: 0,
    title: const Text(
      'संस्थापक सहकार परिवर्तन पॅनल',
      style: TextStyle(color: Colors.white),
    ),
    centerTitle: false,
    actions: [
      IconButton(
        onPressed: () {
          // Navigator.of(context)
          // .push(MaterialPageRoute(builder: (context) => ExportDataPage()));
          showAlertDialogg(context);
        },
        icon: const Icon(
          Icons.import_export,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {
          loginDataProvider.remove();
          Future.delayed(const Duration(seconds: 1), () {
            debugPrint(LoginProvider.appLoginToken);
            loginDataProvider.logOutApi(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const SplashScreen(),
            ));
          });
        },
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
      )
    ],
  );
}

void exportDataFunction(SearchProvider searchProvider,
    LoginProvider loginDataProvider, BuildContext context) {
  debugPrint('${searchProvider.data1}');
  loginDataProvider.exportData(searchProvider.data1, context);
  if (loginDataProvider.lenghtOfData + 1 == loginDataProvider.listOfData) {
    debugPrint('${true}');
    export_csv.myCSV([], loginDataProvider.listOfList.cast<List<String>>());
  }
}
