import 'package:flutter/material.dart';
import 'package:parivartan_app/pages/home/detail/components/custome_row_text.dart';
import 'package:parivartan_app/utlity/utility.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constant.dart';

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
                        title: 'Member Id',
                        subTitle: widget.data['memebr_id'].toString() == 'null'
                            ? '-'
                            : widget.data['memebr_id'].toString(),
                      ),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Sr no',
                          subTitle: widget.data['sr_no'].toString() == 'null'
                              ? '-'
                              : widget.data['sr_no'].toString()),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Name',
                          subTitle: widget.data['English_name'] == 'null'
                              ? '-'
                              : widget.data['English_name']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Marathi name',
                          subTitle: widget.data['Marathi_name'] == 'null'
                              ? '-'
                              : widget.data['Marathi_name']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Address',
                          subTitle: widget.data['English_add'] == 'null'
                              ? '-'
                              : widget.data['English_add']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Voating address',
                          subTitle: widget.data['voting_add'] == 'null'
                              ? '-'
                              : widget.data['voting_add']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Marathi address',
                          subTitle: widget.data['Marathi_add'] == 'null'
                              ? '-'
                              : widget.data['Marathi_add']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Booth no',
                          subTitle: widget.data['booth_no'].toString() == 'null'
                              ? '-'
                              : widget.data['booth_no'].toString()),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Mobile no',
                          subTitle: widget.data['Mobile_no'] == ''
                              ? '-'
                              : widget.data['Mobile_no'].toString()),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Branch',
                          subTitle: widget.data['branch']['name'] == 'null'
                              ? '-'
                              : widget.data['branch']['name']),
                      const SizedBox(height: 15),
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
                      CustomeRowtext(
                          title: 'Company',
                          subTitle: widget.data['village'] == 'null'
                              ? '-'
                              : widget.data['village']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Village',
                          subTitle: widget.data['village'] == 'null'
                              ? '-'
                              : widget.data['village']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Division',
                          subTitle: widget.data['division']['name'] == 'null'
                              ? '-'
                              : widget.data['division']['name']),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Pan no',
                          subTitle: widget.data['pan'].toString() == 'null'
                              ? '-'
                              : widget.data['pan'].toString()),
                      const SizedBox(height: 15),
                      CustomeRowtext(
                          title: 'Aadhar no',
                          subTitle: widget.data['aadhar'].toString() == 'null'
                              ? '-'
                              : widget.data['aadhar'].toString()),
                      const SizedBox(height: 15),
                    ],
                    //
                  ),
                ),
              ),
              //
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () async {
                  if (widget.data['Mobile_no'].toString() == '') {
                    Utils.flushBarErrorMessage(
                        "Don't have Mobile Number?", context);
                  } else {
                    shareFile(widget.data);
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> shareFile(var data) async {
    String phone = widget.data['Mobile_no'];

    String voterName = widget.data['English_name'];
    String voterMarathiName = widget.data['Marathi_name'];
    String memberId = widget.data['memebr_id'].toString() == 'null'
        ? '-'
        : widget.data['memebr_id'].toString();
    String mobileNo = widget.data['Mobile_no'].toString() == 'null'
        ? '-'
        : widget.data['Mobile_no'];

    String votingAdd = widget.data['voting_add'];
    String branchName = widget.data['branch']['name'] == 'null'
        ? '-'
        : widget.data['branch']['name'];

    String srNo = widget.data['sr_no'].toString() == 'null'
        ? '-'
        : widget.data['sr_no'].toString();

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
