import 'package:flutter/material.dart';

import '../../constant.dart';
import '../home/home_page.dart';
import '../login/login_page.dart';
import '../../provider/login_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      var token = await LoginProvider.getUserToken();
      changePage(token.toString());
      print(token == 'null');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor.withOpacity(0.5),
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          appSplashIcon,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  void changePage(String token) {
    if (token == 'null') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }
}
