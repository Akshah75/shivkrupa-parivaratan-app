import 'package:flutter/material.dart';
import 'package:parivartan_app/provider/login_provider.dart';
import 'package:provider/provider.dart';
import '../../../provider/search_provider.dart';
import 'package:to_csv/to_csv.dart' as export_csv;

Future<void> showAlertDialogg(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      final searchProvider = Provider.of<SearchProvider>(context, listen: true);
      print(searchProvider.isLoading);
      final loginDataProvider =
          Provider.of<LoginProvider>(context, listen: true);
      return AlertDialog(
        title: const Text('Export Your Filtre Data.'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            loginDataProvider.fileLoading == true
                ? const Text('Is taking Time...Please Wait...')
                : const SizedBox(),
            loginDataProvider.fileLoading == true
                ? const SizedBox(height: 20)
                : const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('${searchProvider.data1}');
                    loginDataProvider.exportData(searchProvider.data1, context);
                    if (loginDataProvider.lenghtOfData + 1 ==
                        loginDataProvider.listOfData) {
                      print('${true}');
                    }
                  },
                  child: Text('start export'),
                ),
                loginDataProvider.fileLoading == true
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        child: Text(
                          'get File',
                          style: TextStyle(
                              color: loginDataProvider.fileExport == 'compleate'
                                  ? Colors.green
                                  : Colors.grey),
                        ),
                        onPressed: () {
                          if (loginDataProvider.lenghtOfData + 1 ==
                              loginDataProvider.listOfData) {
                            print(true);
                            export_csv.myCSV(
                                [],
                                loginDataProvider.listOfList
                                    .cast<List<String>>());
                          }
                        }),
              ],
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
