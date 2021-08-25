import 'dart:typed_data';

import 'package:pointycastle/api.dart';
import 'package:pointycastle/block/aes_fast.dart';
import 'package:pointycastle/block/modes/ecb.dart';

import '../utils.dart';

class IGE {
  /**
   * Decrypts the given text in 16-bytes blocks by using the given key and 32-bytes initialization vector
   * @param cipherText {Buffer}
   * @param key {Buffer}
   * @param iv {Buffer}
   * @returns {Buffer}
   */
  static List<int> decryptIge(
      List<int> cipherText, List<int> key, List<int> iv) {
    key = Uint8List.fromList(key);
    iv = Uint8List.fromList(iv);
    cipherText = Uint8List.fromList(cipherText);
    List<int> iv1 = iv.sublist(0, (iv.length / 2).floor());
    List<int> iv2 = iv.sublist((iv.length / 2).floor());
    List<int> plainText = <int>[];
    BlockCipher aes = ECBBlockCipher(AESFastEngine());
    aes.init(
      false,
      KeyParameter(key as Uint8List),
    );

    final blocksCount = (cipherText.length / 16).floor();
    final cipherTextBlock = Uint8List.fromList(new List.filled(16, 0));

    for (var blockIndex = 0; blockIndex < blocksCount; blockIndex++) {
      for (var i = 0; i < 16; i++) {
        cipherTextBlock[i] = cipherText[blockIndex * 16 + i] ^ iv2[i];
      }

      //This might be a bug in the crypto module

      final plainTextBlock = aes.process((cipherTextBlock));
      for (var i = 0; i < 16; i++) {
        plainTextBlock[i] ^= iv1[i];
      }

      iv1 = cipherText.sublist(blockIndex * 16, blockIndex * 16 + 16);
      iv2 = plainTextBlock.sublist(0, 16);

      plainText.addAll(iv2);
    }
    return plainText;
  }

  /**
   * Encrypts the given text in 16-bytes blocks by using the given key and 32-bytes initialization vector
   * @param plainText {Buffer}
   * @param key {Buffer}
   * @param iv {Buffer}
   * @returns {Buffer}
   */
  static List<int> encryptIge(
      List<int> plainText, List<int> key, List<int> iv) {
    key = Uint8List.fromList(key);
    iv = Uint8List.fromList(iv);

    final padding = plainText.length % 16;
    if (padding > 0) {
      plainText.addAll(generateRandomBytes(16 - padding));
    }
    plainText = Uint8List.fromList(plainText);

    List<int> iv1 = iv.sublist(0, (iv.length / 2).floor());
    List<int> iv2 = iv.sublist((iv.length / 2).floor());
    BlockCipher aes = ECBBlockCipher(AESFastEngine());
    aes.init(
      true,
      KeyParameter(key as Uint8List),
    );
//aes.setAutoPadding(true)
    List<int> cipherText = [];
    final blockCount = (plainText.length / 16).floor();

    for (var blockIndex = 0; blockIndex < blockCount; blockIndex++) {
      final plainTextBlock = new Uint8List.fromList(
          plainText.sublist(blockIndex * 16, blockIndex * 16 + 16));

      for (var i = 0; i < 16; i++) {
        plainTextBlock[i] ^= iv1[i];
      }
      final cipherTextBlock = aes.process(plainTextBlock);

      for (var i = 0; i < 16; i++) {
        cipherTextBlock[i] ^= iv2[i];
      }

      iv1 = cipherTextBlock;
      iv2 = plainText.sublist(blockIndex * 16, blockIndex * 16 + 16);
      cipherText.addAll(cipherTextBlock);
    }
    return cipherText;
  }
}
