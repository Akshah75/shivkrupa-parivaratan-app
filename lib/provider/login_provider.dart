import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repo/auth_repo.dart';
import '../pages/home/home_page.dart';
import '../utlity/utility.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController controller = TextEditingController();
  static String? appLoginToken;
  final myRepo = AuthRepo();
//

  List exportsData = [];
  List listOfList = [];
  int id = 0;
  bool isLoading = false;
  bool isLogin = false;
  int lenghtOfData = 0;
  int listOfData = 0;

  String fileExport = 'not complete';
  bool fileLoading = false;

  //

  Future<dynamic> loginApi(dynamic data, BuildContext context) async {
    isLogin = true;
    notifyListeners();
    myRepo.loginApi(data).then((value) {
      print(value['status'].toString());
      if (value['status'] == true) {
        print(value['token']);
        appLoginToken = value['token'];
        saveUserToken(appLoginToken.toString());
        notifyListeners();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
        notifyListeners();
        print("appLoginToken:$appLoginToken");
        isLogin = false;
        notifyListeners();
      } else {
        Utils.flushBarErrorMessage("$value['message']", context);
        isLogin = false;
        notifyListeners();
      }
    });
  }

  //
  Future<dynamic> logOutApi(BuildContext context) async {
    myRepo.logout().then((value) {
      print(value['message']);
      if (value['message'] == 'Unauthenticated') {
        print('ok');
      }

      // notifyListeners();
      //   print("appLoginToken:$appLoginToken");
      // } else {
      //   Utils.flushBarErrorMessage("eroor", context);
      // }
    });
  }

  //
  Future<dynamic> exportData(dynamic data, BuildContext context) async {
    fileLoading = true;
    notifyListeners();
    print(fileLoading);
    myRepo.exportApi(data, appLoginToken.toString()).then((value) {
      print('value)f${value.toString()}');
      if (value.toString() == 'null') {
        Utils.flushBarErrorMessage(
            'Plese filtre? than export your data', context);
      }
      // print(value.toString());
      if (value['status'] == true) {
        isLoading = false;
        notifyListeners();
        exportsData = [];
        exportsData = value['data'];
        lenghtOfData = 0;
        lenghtOfData = exportsData.length;
        print("lenght$lenghtOfData");
        notifyListeners();
        // print(exportsData);
        List<String> data = [
          'Village',
          'SR No',
          'Member ID',
          'Mr Name',
          'Mr Address',
          'Mobile Number',
          'En Name',
          'En Address',
          'Agent Name',
          'Agent Branch'
              'Branch',
          'Division',
          'Company'
              'Aadhar no'
              'Pan no'
        ];
        listOfList = [];
        listOfList.add(data);
        for (var el in exportsData) {
          Map<dynamic, dynamic> member = el;
          List<String> newData = [
            member['village'].toString(),
            member['sr_no'].toString(),
            member['memebr_id'].toString(),
            member['Marathi_name'].toString(),
            member['Marathi_add'].toString(),
            member['Mobile_no'].toString(),
            member['English_name'].toString(),
            member['English_add'].toString(),
            member['Agent_name'].toString(),
            member['Agent_branch'].toString(),
            member['branch']['name'].toString(),
            member['division']['name'].toString(),
            member['company'].toString(),
            member['pan'].toString(),
            member['aadhar'].toString(),
          ];
          listOfList.add(newData);
          print('New list: $listOfList');
          notifyListeners();
          // isLoading = false;
          // notifyListeners();
        }
        listOfData = 0;
        listOfData = listOfList.length;
        debugPrint('New list length: $listOfData');

        fileExport = 'not complete';
        if (lenghtOfData + 1 == listOfData) {
          print('compleate');
          fileExport = 'compleate';
          fileLoading = false;
          print(fileLoading);
          notifyListeners();
        } else {
          print('not complete');
          fileExport = 'not complete';
          notifyListeners();
        }
      }
    });
  }

  //save token
  Future<bool> saveUserToken(String token) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', token);
    notifyListeners();
    return true;
  }

  static Future<String> getUserToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    // notifyListeners();
    return appLoginToken = token;
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}
