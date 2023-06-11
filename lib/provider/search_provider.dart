import 'package:flutter/material.dart';
import '../data/repo/auth_repo.dart';
import '../utlity/utility.dart';
import 'login_provider.dart';

class SearchProvider extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController memberId = TextEditingController();
  TextEditingController agentName = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController branchName = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController address3 = TextEditingController();
  //
  List listofBranchData = [];
  bool isLoading = false;
  bool isActive = false;
  int totalpage = 0;
  int currentPage = 0;
  String url = '';
  List link = [];
  // var link = '';
  //
  Map data1 = {};
  final myRepo = AuthRepo();
  //
  Future<dynamic> searchApi(
      dynamic data, String token, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    myRepo.searchApi(data, token).then((value) {
      print('searchData:${value.toString()}');
      if (value['status'] == true) {
        //total page
        var total = value['data']['last_page'];
        print('total:$total');
        totalpage = 0;
        totalpage = total;
        print('total:$totalpage');
        notifyListeners();
        //current page
        currentPage = 0;
        var current = value['data']['current_page'];
        currentPage = current;
        print('total:$currentPage');
        notifyListeners();
        //page url
        var pageUrl = value['data']['first_page_url'];
        url = pageUrl;
        print(url);
        //links
        var links = value['data']['links'];
        link = links;
        //

        print('mylink:$link');

        //
        notifyListeners();
        var data = value['data']['data'];
        print(data.toString());
        //
        listofBranchData = data;
        // listofBranchData
        // .sort((a, b) => (a['sr_no']).compareTo(b['sr_no']));
        // notifyListeners();
        print('myData:$listofBranchData');
        isLoading = false;
        notifyListeners();
      } else {
        Utils.flushBarErrorMessage("$value['message']", context);
        isLoading = false;
        notifyListeners();
      }
    });
  }

  void changePage(int index) {
    // print('myCur:$currentPage');
    currentPage = index;
    notifyListeners();
    // print('my$currentPage');
  }

  Future<void> getPaginationData(int index, BuildContext context) async {
    var urlLink =
        'https://parivartan.artisansintelligence.com/api/search?page=$index';

    // urlList['url']
    // var urlList = link[index];

    // print(urlList);
    // print(urlList[link]);
    // if (urlList['url'] == null) {
    //   isActive = false;
    //   print(isActive);
    //   notifyListeners();
    //   Utils.flushBarErrorMessage('Please Go next Page', context);
    // }
    myRepo.apiServices
        .getPostResponseForSearch(
            urlLink, LoginProvider.appLoginToken.toString())
        .then((value) {
      isActive = true;
      var data = value['data']['data'];
      print(data.toString());
      //
      listofBranchData = data;
      print('myData:$listofBranchData');
      notifyListeners();
      isActive = false;
      print(isActive);
      notifyListeners();
    });
  }
}

  //maraton details
        // branchData.forEach((key, data) {
        //   listofBranchData.add(data);
        // });