import 'package:biometric_storage/biometric_storage.dart';

Future<BiometricStorageFile> getStorageFile() async {
  final authStorage =
      await BiometricStorage().getStorage('authenticated_storage',
          options: StorageFileInitOptions(
            ///Always call it with `authenticationRequired=true`and`authenticationValidityDurationSeconds = -1` to ensure the secure implementation of bioùetric authentication.
            authenticationValidityDurationSeconds: -1,
            authenticationRequired: true,
            androidBiometricOnly: true,
          ));
  return authStorage;
}

Future<void> createBioProtectedEntry(String userName, String password) async {
  BiometricStorageFile storageFile = await getStorageFile();
  String concatenation = "username:$userName,password:$password";
  await storageFile.write(concatenation);
}

Future<String?> getBioProtectedEntry() async {
  BiometricStorageFile storageFile = await getStorageFile();
  final data = await storageFile.read();
  print(data);
  return data;
}
