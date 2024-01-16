import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class MedicalHistory {
  final String question;
  final String yes;
  final String no;
  final String remarks;

  const MedicalHistory(
      {required this.question,
      required this.yes,
      required this.no,
      required this.remarks});
}

class PdfApi {
  static Future<File> generate() async {
    final pdf = Document();
    final headers = [' ', 'YES', 'NO', 'REMARKS'];

    final users = [
      const MedicalHistory(
          question: '1. Do you feel well and healthy today?', yes: '', no: '', remarks: ''),
      const MedicalHistory(
          question: 'Have any flu or cold?', yes: '', no: '', remarks: ''),
      const MedicalHistory(
          question: '2. Have you ever been refused as blood donot or told not to donate blood?', yes: '', no: '', remarks: ''),
      const MedicalHistory(
          question: '3. Have you within the last 12 hours had an alcohol intake?', yes: '', no: '', remarks: ''),
      const MedicalHistory(
          question: '4. Do you intend to drive a heavy transport vehicle or operate a heavy machine within the next twelve(12) hours?', yes: '', no: '', remarks: ''),
    ];
    //convert user object to a list
    final data = users
        .map((med) => [med.question, med.yes, med.no, med.remarks])
        .toList();

    final logo =
        (await rootBundle.load('assets/redcrosslogo.png')).buffer.asUint8List();

    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
          //add logo here
          Center(
            child: Image(
              MemoryImage(logo),
              height: 50,
            ),
          ),
          buildCustomHeader('NATIONAL BLOOD SERVICES'),
          buildCustomHeaderwLine('BLOOD DONOR INTERVIEW SHEET'),
          // Paragraph(text: 'sdawda'),
          // Header(child: Text('My Headline')),
          buildCustomNumHeader('I. PERSONAL DATA ', '(to be filled up by donor.)'),
          buildCustomNumHeader('II. MEDICAL HISTORY', '(Please read carefully and answer all questions. Check()the appropriate answer.'),
          

Table.fromTextArray(
  headers: headers,
  data: data,
  headerStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  cellStyle: TextStyle(fontSize: 10),
  cellAlignment: Alignment.topLeft, // Adjust text alignment as needed
  columnWidths: {
    0: FixedColumnWidth(90), 
    1: FixedColumnWidth(10), 
    2: FixedColumnWidth(10),      
    3: FixedColumnWidth(25),      
  },
),

        ],

        //For page number below
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';

          return Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 1 * PdfPageFormat.cm),
            child: Text(
              text,
              style: TextStyle(color: PdfColors.black),
            ),
          );
        },
      ),
    );

    return saveDocument(name: 'my_form.pdf', pdf: pdf);
  }

  //My Header
  static Widget buildCustomHeader(String text) => Center(
        child: Container(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

    //My Header
static Widget buildCustomNumHeader(String text1, text2) => Row(
  children: [
    Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Text(
        text1,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Text(
        text2,
        style: TextStyle(
          fontSize: 10,
        ),
      ),
    ),
  ],
);


  //My Header w Line (you can align headers with Row (other methods not working))
  static Widget buildCustomHeaderwLine(String text) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Header(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      );

  //Header method sample
  static Widget buildCustomHeadlineSample() => Header(
        child: Text(
          'My Headline 3',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: PdfColors.white,
          ),
        ),
        decoration: BoxDecoration(color: PdfColors.red),
      );

  //Header with image sample
  static Widget buildCustomeHeaderSample() => Container(
        padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
        ),
        child: Row(
          children: [
            PdfLogo(),
            SizedBox(width: 0.5 * PdfPageFormat.cm),
            Text(
              'Create Your PDF',
              style: TextStyle(fontSize: 20, color: PdfColors.blue),
            ),
          ],
        ),
      );

  //Link method
  static Widget buildLink() => UrlLink(
        destination:
            'https://www.youtube.com/watch?v=dQw4w9WgXcQ&pp=ygUJcmljayByb2xs',
        child: Text(
          'Go to flutter.dev',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: PdfColors.blue,
          ),
        ),
      );

  //Bullet method
  static List<Widget> buildBulletPoints() => [
        Bullet(text: 'First Bullet'),
        Bullet(text: 'Second Bullet'),
        Bullet(text: 'Third Bullet'),
      ];

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationCacheDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
