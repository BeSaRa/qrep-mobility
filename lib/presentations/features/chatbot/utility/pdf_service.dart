import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

// class PdfDownloadService {
//   final PlatformChatbotResponseModel response;
//   final String pdfTitle;

//   PdfDownloadService({required this.response, required this.pdfTitle});
//   Future<void> downloadPDF() async {
//     // Request storage permission
//     var status = await Permission.storage.request();
//     if (!status.isGranted) {
//       return;
//     }

//     // Get the current date
//     String formattedDate =
//         DateFormat('yyyy-MM-dd | HH:mm:ss').format(DateTime.now());
// // Load Arabic font
//     final fontData = await rootBundle.load("assets/fonts/Amiri-Regular.ttf");
//     final ttf = pw.Font.ttf(fontData);
//     // Create a PDF document
//     final pdf = pw.Document();

//     // Extract headers from the first entry in the response
//     final headers = response.response.first.keys.toList();

//     // Convert each Map (row) to a List containing its values
//     final List<dynamic> rowdata = response.response.map((row) {
//       return headers.map((key) => row[key].toString()).toList();
//     }).toList();
//     List<List<dynamic>> data2 = [];
//     for (int j = 0; j < rowdata.length; j++) {
//       data2.add(rowdata[j]);
//     }

//     // Load image (if needed)
//     final ByteData imageData = await rootBundle.load(ImageAssets.logoPng);
//     final Uint8List imageBytes = imageData.buffer.asUint8List();
//     final image = pw.MemoryImage(imageBytes);

//     // Add a page to the PDF
//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.Column(
//             children: [
//               // Image at the top
//               pw.Container(
//                 alignment: pw.Alignment.center,
//                 child: pw.Image(image, width: 100, height: 100),
//               ),

//               // Title
//               pw.SizedBox(height: 10),
//               pw.Text(
//                 "${pdfTitle} | $formattedDate",
//                 textAlign: pw.TextAlign.center,
//                 style: pw.TextStyle(
//                     font: ttf, fontSize: 18, fontWeight: pw.FontWeight.bold),
//                 textDirection: pw.TextDirection.rtl,
//               ),

//               pw.SizedBox(height: 10),

//               // Table with Arabic support
//               // Table with Arabic & English support
//               pw.TableHelper.fromTextArray(
//                 headers: headers.map((header) {
//                   bool isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(header);
//                   return pw.Directionality(
//                     textDirection:
//                         isArabic ? pw.TextDirection.rtl : pw.TextDirection.ltr,
//                     child: pw.Text(
//                       header,
//                       textAlign:
//                           pw.TextAlign.center, // Ensure text itself is centered
//                       style: pw.TextStyle(
//                           font: ttf,
//                           fontSize: 14,
//                           fontWeight: pw.FontWeight.bold),
//                     ),
//                   );
//                 }).toList(),
//                 data: data2.map((row) {
//                   return row.map((cell) {
//                     bool isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(cell);
//                     return pw.Container(
//                       alignment: pw.Alignment.center, // Center align the text
//                       child: pw.Directionality(
//                         textDirection: isArabic
//                             ? pw.TextDirection.rtl
//                             : pw.TextDirection.ltr,
//                         child: pw.Text(
//                           cell,
//                           textAlign: pw.TextAlign
//                               .center, // Ensure text itself is centered
//                           style: pw.TextStyle(font: ttf, fontSize: 12),
//                         ),
//                       ),
//                     );
//                   }).toList();
//                 }).toList(),
//                 cellAlignment:
//                     pw.Alignment.center, // Center the entire cell content
//                 headerStyle: pw.TextStyle(
//                     font: ttf, fontSize: 14, fontWeight: pw.FontWeight.bold),
//                 cellStyle: pw.TextStyle(font: ttf, fontSize: 12),
//               ),
//             ],
//           );
//         },
//       ),
//     );

//     // Get the directory for saving the file
//     final directory = await getExternalStorageDirectory();
//     final file = File('${directory?.path}/$pdfTitle.pdf');

//     // Save the PDF file
//     await file.writeAsBytes(await pdf.save());

//   }
// }
class PdfDownloadService {
  final PlatformChatbotResponseModel response;
  final String pdfTitle;

  PdfDownloadService({required this.response, required this.pdfTitle});

  Future<String> downloadPDF() async {
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      return ''; // Return an empty string if permission is denied
    }

    String formattedDate =
        DateFormat('yyyy-MM-dd | HH:mm:ss').format(DateTime.now());

    final fontData = await rootBundle.load("assets/fonts/Amiri-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);
    final pdf = pw.Document();

    final headers = response.response.first.keys.toList();

    // Convert each Map (row) to a List containing its values
    final List<dynamic> rowdata = response.response.map((row) {
      return headers.map((key) => row[key].toString()).toList();
    }).toList();
    List<List<dynamic>> data2 = [];
    for (int j = 0; j < rowdata.length; j++) {
      data2.add(rowdata[j]);
    }

    final ByteData imageData = await rootBundle.load(ImageAssets.logoPng);
    final Uint8List imageBytes = imageData.buffer.asUint8List();
    final image = pw.MemoryImage(imageBytes);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Container(
                alignment: pw.Alignment.center,
                child: pw.Image(image,
                    width: AppSizeW.s100, height: AppSizeW.s100),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                "$pdfTitle | $formattedDate",
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                    font: ttf,
                    fontSize: AppSizeW.s18,
                    fontWeight: pw.FontWeight.bold),
                textDirection: pw.TextDirection.rtl,
              ),
              pw.SizedBox(height: AppSizeH.s10),
              pw.TableHelper.fromTextArray(
                headers: headers.map((header) {
                  bool isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(header);
                  return pw.Directionality(
                    textDirection:
                        isArabic ? pw.TextDirection.rtl : pw.TextDirection.ltr,
                    child: pw.Text(
                      header,
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle(
                          font: ttf,
                          fontSize: AppSizeW.s14,
                          fontWeight: pw.FontWeight.bold),
                    ),
                  );
                }).toList(),
                data: data2.map((row) {
                  return row.map((cell) {
                    bool isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(cell);
                    return pw.Container(
                      alignment: pw.Alignment.center,
                      child: pw.Directionality(
                        textDirection: isArabic
                            ? pw.TextDirection.rtl
                            : pw.TextDirection.ltr,
                        child: pw.Text(
                          cell,
                          textAlign: pw.TextAlign.center,
                          style:
                              pw.TextStyle(font: ttf, fontSize: AppSizeW.s12),
                        ),
                      ),
                    );
                  }).toList();
                }).toList(),
                cellAlignment: pw.Alignment.center,
                headerStyle: pw.TextStyle(
                    font: ttf,
                    fontSize: AppSizeW.s14,
                    fontWeight: pw.FontWeight.bold),
                cellStyle: pw.TextStyle(font: ttf, fontSize: AppSizeW.s12),
              ),
            ],
          );
        },
      ),
    );

    // // **Get the downloads folder path**
    // Directory? downloadsDirectory;

    // if (Platform.isAndroid) {
    //   downloadsDirectory = Directory('/storage/emulated/0/Download');
    // } else if (Platform.isIOS) {
    //   downloadsDirectory = await getApplicationDocumentsDirectory();
    // }

    // final filePath = '${downloadsDirectory?.path}/$pdfTitle.pdf';
    // final file = File(filePath);

    // await file.writeAsBytes(await pdf.save());

    // return filePath;
    final directory = await getExternalStorageDirectory();
    final file = File('${directory?.path}/$pdfTitle.pdf');
    await file.writeAsBytes(await pdf.save());

    return file.path;
  }
}
