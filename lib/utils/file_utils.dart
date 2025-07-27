import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<void> writeToFile(String fileName, String content) async {
    try {
      // Get the document directory using path_provider
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      // Create a File object with the desired file name
      File file = File('$appDocPath/$fileName');

      // Write to the file
      await file.writeAsString(content);

      if (kDebugMode) {
      }
    } catch (e) {
      if (kDebugMode) {
      }
    }
  }

  //----------------------------------------
  static Future<String> readFromFile(String fileName) async {
    try {
      // Get the application documents directory
      Directory documentsDirectory = await getApplicationDocumentsDirectory();

      // Construct the file path
      String filePath = '${documentsDirectory.path}/$fileName';

      // Check if the file exists
      if (await File(filePath).exists()) {
        // Read the file content
        String content = await File(filePath).readAsString();
        return content;
      } else {
        if (kDebugMode) {
        }
        return ''; // Return an empty string if the file does not exist
      }
    } catch (e) {
      if (kDebugMode) {
      }
      return ''; // Return an empty string if there's an error
    }
  }

  //------------------------------------------
  static Future<void> deleteFile(String fileName) async {
    try {
      // Get the document directory using path_provider
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String filePath = documentsDirectory.path;

      // Create a File object with the desired file name
      File file = File('$filePath/$fileName');

      // Check if the file exists before attempting to delete
      if (await file.exists()) {
        // Delete the file
        await file.delete();

        if (kDebugMode) {
        }
      } else {
        if (kDebugMode) {
        }
      }
    } catch (e) {
      // Handle errors, e.g., if there's an issue accessing the file system
      if (kDebugMode) {
      }
    }
  }

  //---------------------------------------------

  static Future<bool> fileExists(String fileName) async {
    try {
      // Get the document directory using path_provider
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      // Check if the file exists
      File file = File('$appDocPath/$fileName');
      return await file.exists();
    } catch (e) {
      // Handle errors, e.g., if there's an issue accessing the file system
      if (kDebugMode) {
      }
      return false;
    }
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}