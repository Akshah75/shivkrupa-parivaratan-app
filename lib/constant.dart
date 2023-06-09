//App Colors
import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

//AppColors
Color blueColor = HexColor("#034ea1");
Color halfWhite = HexColor("#fafafa");
const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color greyColor = Colors.grey;
const Color redColor = Colors.red;
const Color yellowColor = Colors.yellow;
const Color transparentColor = Colors.transparent;
Color textColor = HexColor('#566985');

//textcolor
var greyTextColor = greyColor.withAlpha(250);

//
var containerColor = greyColor.withOpacity(0.1);
var textColor1 = blackColor.withOpacity(0.2);
//
//AppImages
// const String bgLoginPage = 'asset/image/blob.svg';
const String bgLoginPage = 'asset/image/bglogin.svg';
const String bgSignPage = 'asset/image/bg_sign.svg';

//AppIcons
const String visibleEye = 'asset/icons/visible_eye.svg';
const String menu = 'asset/icons/menu.svg';
const String demo = 'asset/image/demo4.jpg';
const String fillStar = 'asset/icons/filled_star.png';
const String star = 'asset/icons/star.png';

//url image
const urlImage1 =
    'https://images.ctfassets.net/23aumh6u8s0i/4TsG2mTRrLFhlQ9G1m19sC/4c9f98d56165a0bdd71cbe7b9c2e2484/flutter';
//
//app all sizes

class HeadingText extends StatelessWidget {
  const HeadingText({
    super.key,
    required this.text,
    this.color = blackColor,
    this.fontSize = 22,
  });
  final String text;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
        letterSpacing: 1.5,
        color: color,
      ),
    );
  }
}

double defaultPading = 20;

class AppSize {
  static double? appSceenHeight;
  static double? appScrrenWidth;
  static double appDefaultPading = 15;
  //
  static void appSize(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    appSceenHeight = height;
    appScrrenWidth = width;
    //
    // appDefaultPading = height * 0.02;
  }
}

var spacingHeightMax = const SizedBox(height: 20);
var spacingHeightMedium = const SizedBox(height: 15);
var spacingHeightMin = const SizedBox(height: 5);
var spacingHeightMin1 = const SizedBox(height: 10);
//
var padding = const EdgeInsets.only(left: 20, right: 20);
//
var customeText =
    "Welcome to the MG Vadodara Marathon 2023. On 7th January become a part of history by participating in the 11th Edition of India's Largest Marathon.Vadodara Marathon is a World Marathon Majors Qualifying Race of the Abbott Wanda World Marathon Majors.Vadodara Marathon’s motto of “Sports, Seva, Swachchata” is at the core of all the activities, supporting various social and civic causes. Vadodara Marathon, or VM, offers a platform to local NGOs and Divyang Associations to increase their visibility, raise awareness and funds for their causes.";
var headingText =
    'We are #BackToRun. Eleventh Edition of the Vadodara Marathon.';

void appNav(BuildContext context) {
  Navigator.of(context);
}

//
var boxStyle = BoxDecoration(
  borderRadius: BorderRadius.circular(12),
  color: greyColor,
);

var defaultSymetricPeding =
    const EdgeInsets.symmetric(horizontal: 10, vertical: 10);
var defaultSpaceHeight = const SizedBox(height: 10);

//
class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
    required this.hintText,
    this.icon = Icons.person,
    required this.controller,
  });
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: blueColor.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,

        controller: controller,
        // onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          suffixIcon: Icon(
            icon,
            color: blueColor,
          ),
          // iconColor: blueColor,
          hintStyle: TextStyle(
            color: greyColor.withOpacity(0.6),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
      ),
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.text,
    required this.pres,
  });
  final String text;
  final VoidCallback pres;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: TextButton(
          onPressed: pres,
          child: TextWidget(
            text: text,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}

//
class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.color = blackColor,
    this.fontSize = 16,
    this.letterSpacing = 1.5,
    this.weight = FontWeight.bold,
  });
  final String text;
  final Color color;
  final double fontSize;
  final double letterSpacing;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: weight,
        fontFamily: 'Roboto',
        letterSpacing: 1.5,
        color: color,
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.text,
    required this.passwordController,
  });
  final String text;
  final TextEditingController passwordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool active = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: blueColor.withOpacity(0.3),
          // color: greyColor.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: TextFormField(
        controller: widget.passwordController,
        obscureText: active,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: IconButton(
            splashColor: blueColor.withOpacity(0.1),
            onPressed: () {
              setState(() {
                active = !active;
              });
            },
            icon: active
                ? Icon(
                    Icons.visibility,
                    color: blueColor,
                  )
                : Icon(
                    Icons.visibility_off,
                    color: blueColor,
                  ),
          ),
          hintText: widget.text,
          hintStyle: TextStyle(
            color: greyColor.withOpacity(0.6),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        ),
      ),
    );
  }
}
//

// list of colors that we use in our app
const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF035AA6);
const kSecondaryColor = Color(0xFFFFA41B);
const kTextColor = Color(0xFF000839);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF40BAD5);

const kDefaultPadding = 20.0;

// our default Shadow
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);

//
//app image
const String appLogo = 'asset/logo.png';
const String noDataFound = 'asset/no_data.png';
const String whatsapp = 'asset/whatsapp.png';
var csvFile = 'asset/Members.csv';
const String appLogoIcon = 'asset/app_icon_logo.png';
