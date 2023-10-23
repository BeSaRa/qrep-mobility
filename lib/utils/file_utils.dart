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
        print('File saved at: ${file.path}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error saving file: $e');
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
          print('File not found: $filePath');
        }
        return ''; // Return an empty string if the file does not exist
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error reading file: $e');
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
          print('File deleted: ${file.path}');
        }
      } else {
        if (kDebugMode) {
          print('File not found: ${file.path}');
        }
      }
    } catch (e) {
      // Handle errors, e.g., if there's an issue accessing the file system
      if (kDebugMode) {
        print('Error deleting file: $e');
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
        print('Error checking file existence: $e');
      }
      return false;
    }
  }
}
