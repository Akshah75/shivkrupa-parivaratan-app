import 'package:flutter/material.dart';
import 'package:parivartan_app/constant.dart';
import 'package:parivartan_app/provider/login_provider.dart';
import 'package:parivartan_app/provider/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:to_csv/to_csv.dart' as export_csv;

class ExportDataPage extends StatelessWidget {
  const ExportDataPage({
    super.key,
    // required this.searchProvider,
    // required this.loginDataProvider
  });

  // final SearchProvider searchProvider;
  // final LoginProvider loginDataProvider;

//   @override
//   State<ExportDataPage> createState() => _ExportDataPageState();
// }

// class _ExportDataPageState extends State<ExportDataPage> {
//   @override
//   void initState() {
//     super.initState();
//     // loginDataProvider.fileLoading = true;
//     // loginDataProvider.exportData(searchProvider.data1, context);
//   }

  @override
  Widget build(BuildContext context) {
    print('build');
    final searchProvider = Provider.of<SearchProvider>(context, listen: true);
    print(searchProvider.isLoading);
    final loginDataProvider = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
      // backgroundColor: kPrimaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: whiteColor),
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Export Data',
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: loginDataProvider.fileLoading == true
          ? const Text('Loading...')
          : Center(
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('This is a demo alert dialog.'),
                    const Text('Would you like to approve of this message?'),
                    Row(
                      children: [
                        TextButton(
                            child: const Text('start export'),
                            onPressed: () {
                              loginDataProvider.fileLoading = true;
                              print(
                                  'Filelo:${loginDataProvider.fileLoading = true}');
                              print('${searchProvider.data1}');
                              loginDataProvider.exportData(
                                  searchProvider.data1, context);
                              if (loginDataProvider.lenghtOfData + 1 ==
                                  loginDataProvider.listOfData) {}
                            }),
                        TextButton(
                            child: Text(
                              'get File',
                              style: TextStyle(
                                  color: loginDataProvider.fileExport ==
                                          'compleate'
                                      ? Colors.green
                                      : Colors.grey),
                            ),
                            onPressed: () {
                              if (loginDataProvider.lenghtOfData + 1 ==
                                  loginDataProvider.listOfData) {
                                export_csv.myCSV(
                                    [],
                                    loginDataProvider.listOfList
                                        .cast<List<String>>());
                              }
                            }),
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            loginDataProvider.fileLoading = false;
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
