import 'package:flutter/material.dart';
import '../../constant.dart';
import 'package:provider/provider.dart';

import '../../data/repo/auth_repo.dart';
import '../home/home_page.dart';
import '../../provider/login_provider.dart';
import '../../utlity/utility.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // FocusNode nameFocusNode=FocusNode();
  // FocusNo
  //de passwordFocusNode=FocusNode();
  @override
  void initState() {
    super.initState();

    // changePage(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final myRepo = AuthRepo();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final loginDataProvider = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    //App logo
                    Container(
                      height: 150,
                      width: 400,
                      margin: EdgeInsets.only(top: height * 0.15),
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Image.asset(appLogo),
                    ),
                    //Text
                    const SizedBox(height: 25),
                    HeadingText(text: 'Login', color: blueColor),
                    const SizedBox(height: 25),
                    //TextField
                    CustomeTextField(
                      hintText: 'Enter Your username',
                      controller: nameController,
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 25),
                    PasswordTextField(
                      text: 'Enter Your Password',
                      passwordController: passwordController,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const TextWidget(
                            text: 'Forget Password?',
                            fontSize: 12,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    loginDataProvider.isLogin == true
                        ? const Center(child: CircularProgressIndicator())
                        : TextButtonWidget(
                            text: 'Login',
                            pres: () {
                              //
                              if (nameController.text.isEmpty &&
                                  nameController.text.length > 10) {
                                Utils.flushBarErrorMessage(
                                    'Please enter username', context);
                              } else if (passwordController.text.isEmpty) {
                                Utils.flushBarErrorMessage(
                                    'Please entre password', context);
                              } else {
                                Map data = {
                                  'mobile':
                                      int.parse(nameController.text.trim()),
                                  'password': passwordController.text.trim(),
                                };
                                print('api hit');
                                loginDataProvider.loginApi(data, context);
                                //
                              }
                            },
                          ),
                    SizedBox(height: height * 0.2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changePage(BuildContext context) {
    if (LoginProvider.appLoginToken == null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }
}

  // void onSubmits() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();

  //   sharedPreferences.setString(
  //       "username", controlller.usernameController.text.trim());

  //   sharedPreferences.setString(
  //       "password", controlller.passwordController.text.trim());

  //   final SharedPreferences sharedPreference =
  //       await SharedPreferences.getInstance();
  //   final username = sharedPreference.getString("username");
  //   final passwords = sharedPreference.getString("password");

  //   setState(() {
  //     if (username != null && passwords != null) {
  //       finalUserName = username;
  //       finalPassword = passwords;
  //     }
  //   });
  //   print(finalUserName);

  //   controlller.loginWithUsernameController(
  //       context, finalUserName, finalPassword);
  // }