import 'dart:convert';
import 'dart:math';

class CustomEncryption {
  CustomEncryption(this._secretKey);

  final String _secretKey;

  static const int _cipherBlockSize = 8;

// Utilizes XOR logic and Initialization Vector (IV) to Encrypt the Input Text
  String encrypt(String text) {
    final iv = _generateRandomIV();
    final paddedText = _padText(text);
    List<int> cypherBytes = [];

    // Encrypt each cipherBlock with XOR and permutation
    for (int i = 0; i < paddedText.length; i++) {
      int encryptedChar = paddedText.codeUnitAt(i) ^
          _secretKey.codeUnitAt(i % _secretKey.length);
      encryptedChar ^= iv[i % iv.length]; // XOR with IV
      cypherBytes.add(encryptedChar);
    }

    // Appends IV before encoding to Base64 to enhance security
    return base64Encode(iv + cypherBytes);
  }

  // Utilizes the XOR Logic to Decrypt CypherText
  String decrypt(String cypherText) {
    final cypherBytes = base64Decode(cypherText);

    // To Extract IV from the ciphertext
    final iv = cypherBytes.sublist(0, _cipherBlockSize);
    final encryptedBytes = cypherBytes.sublist(_cipherBlockSize);

    List<int> decodedBytes = [];

    // To Reverse the Encryption using XOR and IV
    for (int i = 0; i < encryptedBytes.length; i++) {
      int decryptedChar = encryptedBytes[i] ^ iv[i % iv.length];
      decryptedChar ^= _secretKey.codeUnitAt(i % _secretKey.length);
      decodedBytes.add(decryptedChar);
    }

    return _unpadText(String.fromCharCodes(decodedBytes));
  }

  // To Generate a secure random IV for added Security
  List<int> _generateRandomIV() {
    final random = Random.secure();
    return List<int>.generate(_cipherBlockSize, (i) => random.nextInt(256));
  }

  // To Pad the input text to a multiple of the block size  to fill the remaining space.
  String _padText(String text) {
    int paddingLength = _cipherBlockSize - (text.length % _cipherBlockSize);
    return text +
        String.fromCharCodes(List.filled(paddingLength, paddingLength));
  }

  // To Remove padding after decryption
  String _unpadText(String text) {
    int paddingValue = text.codeUnitAt(text.length - 1);
    return text.substring(0, text.length - paddingValue);
  }
}
