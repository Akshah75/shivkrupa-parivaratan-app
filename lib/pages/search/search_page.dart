import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../../provider/login_provider.dart';
import '../../provider/search_provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: true);
    print(searchProvider.isLoading);
    // final loginDataProvider = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 20),
              CustomeTextField(
                hintText: 'Name',
                controller: searchProvider.name,
              ),
              const SizedBox(height: 10),
              CustomeTextField(
                hintText: 'Member id',
                icon: Icons.person,
                controller: searchProvider.memberId,
              ),
              const SizedBox(height: 10),
              CustomeTextField(
                hintText: 'Mobile number',
                icon: Icons.phone_android,
                controller: searchProvider.mobileNo,
              ),
              const SizedBox(height: 10),
              CustomeTextField(
                hintText: 'Agent name',
                icon: Icons.person_4_sharp,
                controller: searchProvider.agentName,
              ),
              const SizedBox(height: 10),
              CustomeTextField(
                hintText: 'Company name',
                icon: Icons.person_4_sharp,
                controller: searchProvider.companyName,
              ),
              const SizedBox(height: 10),
              // CustomeTextField(
              //   hintText: 'Branch name',
              //   icon: Icons.person_4_sharp,
              //   controller: searchProvider.branchName,
              // ),
              // const SizedBox(height: 10),
              CustomeTextField(
                hintText: 'Address 1',
                icon: Icons.location_city,
                controller: searchProvider.address1,
              ),
              const SizedBox(height: 10),
              CustomeTextField(
                hintText: 'Address 2',
                icon: Icons.location_city,
                controller: searchProvider.address2,
              ),
              const SizedBox(height: 10),
              CustomeTextField(
                hintText: 'Address 3',
                icon: Icons.location_city,
                controller: searchProvider.address3,
              ),
              const SizedBox(height: 15),
              searchProvider.isLoading == true
                  ? const Center(child: CircularProgressIndicator())
                  : TextButtonWidget(
                      text: 'Search',
                      pres: () {
                        List adressOfList = [
                          searchProvider.address1.text,
                          searchProvider.address2.text,
                          searchProvider.address3.text
                        ];
                        Map data2 = {
                          "name": searchProvider.name.text,
                          "member": searchProvider.memberId.text,
                          "mobile": searchProvider.mobileNo.text,
                          "agent": searchProvider.agentName.text,
                          "branch": searchProvider.branchName.text,
                          "company": searchProvider.companyName.text,
                          "address": adressOfList
                        };
                        print(LoginProvider.appLoginToken.toString());
                        searchProvider.data1 = data2;
                        print('My Data name:$data2');
                        searchProvider.searchApi(data2,
                            LoginProvider.appLoginToken.toString(), context);
                        // searchProvider.isLoading = true;
                        print(searchProvider.isLoading);
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.of(context).pop();
                          searchProvider.isLoading = false;
                          searchProvider.branchName.clear();
                          searchProvider.name.clear();
                        });
                      },
                    ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
