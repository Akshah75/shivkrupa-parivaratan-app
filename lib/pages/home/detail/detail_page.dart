import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parivartan_app/pages/home/detail/components/custome_row_text.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:whatsapp_share2/whatsapp_share2.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp_share/whatsapp_share.dart';

import '../../../constant.dart';

// import 'package:to_csv/to_csv.dart' as export_csv;
// import 'package:to_csv/to_csv.dart' as export_csv;
// import 'package:to_csv/to_csv.dart' as export_csv;
// import 'package:to_csv/to_csv.dart' as export_csv;
// import 'package:to_csv/to_csv.dart' as export_csv;

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, this.data});
  // ignore: prefer_typing_uninitialized_variables
  final data;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    // final loginDataProvider = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
      // backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: whiteColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomeRowtext(
                          title: 'Member Id',
                          subTitle: widget.data['memebr_id'].toString()),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Sr no',
                          subTitle: widget.data['sr_no'].toString()),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Name', subTitle: widget.data['English_name']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Marathi name',
                          subTitle: widget.data['Marathi_name']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Address',
                          subTitle: widget.data['English_add']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Marathi address',
                          subTitle: widget.data['Marathi_add']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Mobile no',
                          subTitle: widget.data['Mobile_no'] == ''
                              ? '-'
                              : widget.data['Mobile_no'].toString()),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Branch',
                          subTitle: widget.data['branch']['name']),
                      const SizedBox(height: 15),
                      // CustomeRowtext(
                      //     title: 'Divivio Id ',
                      //     subTitle: widget.data['division_id'].toString()),
                      // const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Agent name',
                          subTitle: widget.data['Agent_name'] == ''
                              ? '-'
                              : widget.data['Agent_name']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Agent branch',
                          subTitle: widget.data['Agent_branch'] == ''
                              ? '-'
                              : widget.data['Agent_branch']),
                      const SizedBox(height: 15),
                      // CustomeRowtext(
                      //     title: 'Id ', subTitle: widget.data['id'].toString()),
                      // CustomeRowtext(
                      //     title: 'Branch Id',
                      //     subTitle: widget.data['branch_id'].toString()),
                      // const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Company', subTitle: widget.data['village']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Village', subTitle: widget.data['village']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Division',
                          subTitle: widget.data['division']['name']),
                      const SizedBox(height: 15),
                    ],
                    //
                  ),
                ),
              ),
              //
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  shareFile(widget.data);
                },
                child: Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: whiteColor.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const SizedBox(
                      height: 10,
                      width: 10,
                      child: Image(
                        width: 10,
                        color: Colors.green,
                        image: AssetImage(
                          whatsapp,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final String _phone = '9082589853';
  Future<void> shareFile(var data) async {
    String voterName = widget.data['Marathi_name'];
    String boothNo = widget.data['booth_no'].toString() == 'null'
        ? '-'
        : widget.data['booth_no'];
    String votingAdd = widget.data['voting_add'];
    String message = '''
    Voter Name: $voterName
  Booth No.: $boothNo
  Voting Address: $votingAdd
  ''';
    const urlImage = appLogoIcon;
    final urls = Uri.parse(urlImage);
    final res = await http.get(urls);
    final bytes = res.bodyBytes;
    //
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/image.jpg';
    File(path).writeAsBytesSync(bytes);
    // await Share.shareFiles([path], text: message);
    await WhatsappShare.shareFile(
      phone: _phone,
      text: message,
      filePath: [path],
    );
    // sendWhatsAppMessage(_phone, message, path);
    // sendWhatsAppMessage(_phone, message, path);
  }
}
//

Future<void> launchUrls(Uri url) async {
  if (await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

// Future<void> isInstalled() async {
//   final val = await WhatsappShare.isInstalled();
//   print('Whatsapp is installed: $val');
// }
void sendWhatsAppMessage(String number, String message, var imageUrl) async {
  // var whatsappUrl = Uri.parse(
  //     "whatsapp://send?phone=+91$number&text=$message&attachment=${Uri.encodeFull(imageFile)}");
  final whatsappUrl =
      "https://wa.me/$number?text=${Uri.encodeComponent(message)}&attachment=${Uri.encodeFull(imageUrl)}";

  // if (await canLaunchUrl(whatsappUrl)) {
  //   await launchUrl(whatsappUrl);
  // } else {
  //   throw 'Could not launch $whatsappUrl';
  // }

  if (Platform.isIOS) {
    if (await canLaunchUrl(whatsappUrl as Uri)) {
      await launchUrl(whatsappUrl as Uri);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  } else {
    try {
      await const MethodChannel("com.whatsapp")
          .invokeMethod("launch", whatsappUrl);
    } on PlatformException catch (e) {
      throw 'Could not launch WhatsApp: ${e.message}';
    }
  }
}

// void sendWhatsAppMessag(String number, String message,
//     {File? imageFile}) async {
//   final whatsappUr =
//       "whatsapp://send?phone=$number&text=${Uri.encodeFull(message)}";

//   if (imageFile != null) {
//     final imageUrl = await saveImageLocally(imageFile);
//     whatsappUr += "&attachment=${Uri.encodeFull(imageUrl)}";
//   }
// }

// void sendWhatsAppMessag(String number, String message,
//     {File? imageFile}) async {
//   var whatsappUrl =
//       "whatsapp://send?phone=$number&text=${Uri.encodeFull(message)}";

  // if (Platform.isIOS) {
  //   if (await canLaunchUrl(whatsappUrl as Uri)) {
  //     await launchUrl(whatsappUrl as Uri);
  //   } else {
  //     throw 'Could not launch $whatsappUrl';
  //   }
  // } else {
  //   try {
  //     await const MethodChannel("com.whatsapp")
  //         .invokeMethod("launch", whatsappUrl);
  //   } on PlatformException catch (e) {
  //     throw 'Could not launch WhatsApp: ${e.message}';
  //   }
  // }
// }

// Future<String> _saveImageLocally(File imageFile) async {
//   final appDir = await getApplicationDocumentsDirectory();
//   final fileName = path.basename(imageFile.path);
//   final savedImage = await imageFile.copy('${appDir.path}/$fileName');
//   return savedImage.path;
// }
