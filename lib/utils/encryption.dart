import 'package:encrypt/encrypt.dart' as encrypt;

const fernetSalt = "f4e45b9a033ae3b1bd2b15ecea2a9810";

String decryptFernet(String password, String input) {
  final padKey = password + fernetSalt;
  final b64key = encrypt.Key.fromUtf8(padKey.substring(0, 32));
  final fernet = encrypt.Fernet(b64key);
  final encrypter = encrypt.Encrypter(fernet);

  var out = encrypt.Encrypted.fromBase64(input);
  return encrypter.decrypt(out).toString();
}

String encryptFernet(String password, String input) {
  final padKey = password + fernetSalt;
  final b64key = encrypt.Key.fromUtf8(padKey.substring(0, 32));
  final fernet = encrypt.Fernet(b64key);
  final encrypter = encrypt.Encrypter(fernet);
  final encrypted = encrypter.encrypt(input);
  return encrypted.base64;
}
