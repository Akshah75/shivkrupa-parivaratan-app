import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../provider/login_provider.dart';
import '../../provider/search_provider.dart';
import '../search/search_page.dart';
import 'home_components/app_bar_of_home_page.dart';
import 'home_components/data_show_container.dart';
import 'home_components/no_data_container.dart';
import 'home_components/search_container.dart';
import 'home_components/table_heding_contaner.dart';
import 'detail/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final searchProvider = Provider.of<SearchProvider>(context, listen: true);
    final loginDataProvider = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: appBar(searchProvider, loginDataProvider, context),
      body: Column(
        children: [
          SearchContainer(press: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SearchPage()));
          }),
          const TableHedingOfHomepage(),
          const SizedBox(height: 2),
          searchProvider.currentPage == 0
              ? const NoDataFoundContainer()
              : Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      searchProvider.isActive == true
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: searchProvider.listofBranchData.length,
                              itemBuilder: (context, index) {
                                var data =
                                    searchProvider.listofBranchData[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                                data: data,
                                              )),
                                    );
                                  },
                                  child: DataShowContainer(data: data),
                                );
                              }),
                    ],
                  ),
                ),
          searchProvider.totalpage == 0
              ? Container()
              : Container(
                  color: whiteColor,
                  child: NumberPaginator(
                    initialPage: searchProvider.currentPage - 1,
                    onPageChange: (int index) {
                      searchProvider.changePage(index + 1);
                      searchProvider.isActive = true;
                      searchProvider.getPaginationData(index + 1, context);
                      print(searchProvider.isActive);
                    },
                    numberPages: searchProvider.totalpage,
                  ),
                ),
        ],
      ),
    );
  }
}
