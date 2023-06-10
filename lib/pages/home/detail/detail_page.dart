import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:parivartan_app/pages/home/detail/components/custome_row_text.dart';
import 'package:parivartan_app/utlity/utility.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constant.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    // final loginDataProvider = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: whiteColor),
        title: const Text(
          'User Detail',
          style: TextStyle(color: whiteColor),
        ),
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
                          title: 'Sr no',
                          subTitle: data['sr_no'].toString() == 'null'
                              ? '-'
                              : data['sr_no'].toString()),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                        title: 'Member Id',
                        subTitle: data['memebr_id'].toString() == 'null'
                            ? '-'
                            : data['memebr_id'].toString(),
                      ),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                        title: 'Name',
                        subTitle: data['English_name'] == 'null'
                            ? '-'
                            : data['English_name'],
                      ),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                        title: 'Marathi name',
                        subTitle: data['Marathi_name'] == 'null'
                            ? '-'
                            : data['Marathi_name'],
                      ),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Marathi address',
                          subTitle: data['Marathi_add'] == 'null'
                              ? '-'
                              : data['Marathi_add']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Mobile no',
                          subTitle: data['Mobile_no'] == ''
                              ? '-'
                              : data['Mobile_no'].toString()),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Pan no',
                          subTitle: data['pan'].toString() == 'null'
                              ? '-'
                              : data['pan'].toString()),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Aadhar no',
                          subTitle: data['aadhar'].toString() == 'null'
                              ? '-'
                              : data['aadhar'].toString()),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Branch',
                          subTitle: data['branch']['name'] == 'null'
                              ? '-'
                              : data['branch']['name']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                        title: 'Voating address',
                        subTitle: data['voting_add'] == 'null'
                            ? '-'
                            : data['voting_add'],
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                        title: 'Agent name',
                        subTitle: data['Agent_name'] == ''
                            ? '-'
                            : data['Agent_name'].toString(),
                      ),
                    ],
                    //
                  ),
                ),
              ),
              //
              const SizedBox(height: 40),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (data['Mobile_no'].toString() == '') {
                        Utils.flushBarErrorMessage(
                            "Don't have Mobile Number?", context);
                      } else {
                        shareFile(data);
                      }
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
                  const SizedBox(width: 40),
                  GestureDetector(
                    onTap: () async {
                      if (data['Mobile_no'].toString() == '') {
                        Utils.flushBarErrorMessage(
                            "Don't have Mobile Number?", context);
                      } else {
                        callNumber(data, context);
                      }
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
                            color: Colors.blue,
                            image: AssetImage(
                              call,
                            ),
                          ),
                        )),
                  ),
                ],
              )

              //
              // TextButton(
              //     onPressed: () {
              //       callNumber(data, context);
              //     },
              //     child: Text(
              //       'call',
              //       style: TextStyle(color: redColor),
              //     ))
            ],
          ),
        ),
      ),
    );
  }

  //
  callNumber(var data, BuildContext context) async {
    var phoneNumber = data['Mobile_no'];
    // if (phoneNumber.toString() == '') {
    //   Utils.flushBarErrorMessage("Don't have Mobile Number?", context);
    // }
    var number = phoneNumber; //set the number here
    var res = await FlutterPhoneDirectCaller.callNumber(number);
    print(res);
  }

//
  Future<void> shareFile(var data) async {
    String phone = data['Mobile_no'];

    String voterName = data['English_name'];
    String voterMarathiName = data['Marathi_name'];
    String memberId = data['memebr_id'].toString() == 'null'
        ? '-'
        : data['memebr_id'].toString();
    String mobileNo =
        data['Mobile_no'].toString() == 'null' ? '-' : data['Mobile_no'];

    String votingAdd = data['voting_add'];
    String branchName =
        data['branch']['name'] == 'null' ? '-' : data['branch']['name'];

    String srNo =
        data['sr_no'].toString() == 'null' ? '-' : data['sr_no'].toString();

    // String head =
    //     "शिवकृपा सरकारी पतपेढी लि. मुंबई पंचवार्षिक निवडणूक २०२३-२८ संस्थापक सहकार परिवर्तन पॅनल";

    String message = '''
*शिवकृपा सरकारी पतपेढी लि. मुंबई पंचवार्षिक निवडणूक २०२३-२८*

*संस्थापक सहकार परिवर्तन पॅनल*

*मतदार यादी क*  :  $srNo
*सभासद क्*     :   $memberId
*नाव*           :   $voterMarathiName/$voterName
*मोबाइल*        :   $mobileNo
*शाखा*          :   $branchName
*मतदान केंद्र पत*  :   $votingAdd

*सहकार पॅनलच्या कपबशी याच चिन्हावर शिक्का*
*मारून प्रचंड बहुमताने विजयी करा.*
''';
    // const myurl =
    //     'https://parivartan.artisansintelligence.com/assets/images/cover.jpeg';
    // const urlImage = myurl;
    // final urls = Uri.parse(urlImage);
    // final res = await http.get(urls);
    // final bytes = res.bodyBytes;
    // //
    // final temp = await getTemporaryDirectory();
    // final path = '${temp.path}/image.jpg';
    // File(path).writeAsBytesSync(bytes);
    // await Share.shareFiles([path], text: message);
    // await WhatsappShare.shareFile(
    //   phone: phone,
    //   text: message,
    //   filePath: [path],
    // );
    // String phoneNumber = '9082589853';
    sendWhatsAppMessage(phone, message);
  }
}

// *Marathi Name*    :    $voterName
//
void sendWhatsAppMessage(String phoneNumber, String message) async {
  final whatsappUrl =
      Uri.parse("whatsapp://send?phone=91$phoneNumber&text=$message");
  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl);
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}
