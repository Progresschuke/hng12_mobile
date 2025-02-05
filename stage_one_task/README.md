# stage_one_task

# Custom Encryption Library for Dart

## Overview

This project provides a simple and secure way to encrypt and decrypt text using XOR operations and an Initialization Vector (IV). The encryption ensures confidentiality by applying random transformations with an added layer of security using Initialization Vector (IV).

Features

- XOR-based encryption and decryption
- Case-Sensitive Encryption Method
- Secure random IV generation for added security

## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### How to Use

#### Step 1: Import the Class

Ensure that the custom_encryption.dart file is part of your Dart project.

import 'custom_encryption.dart';

#### Step 2: Initialize the Encryption Class

Create an instance of CustomEncryption by passing a secret key.

void main() {
String secretKey = "mySecretKey569";
CustomEncryption encryption = CustomEncryption(secretKey);

// Example input
String inputText = "Hello, Secure My Data!";

// Encrypt the text
String encryptedText = encryption.encrypt(inputText);
print("Encrypted: \$encryptedText");

// Decrypt the text
String decryptedText = encryption.decrypt(encryptedText);
print("Decrypted: \$decryptedText");
}

#### Example Output

Encrypted: gDsF0mx1z+2lJzrbYCuKyq49CZU/bO/t8xoH1Ggghoo=
Decrypted: Hello, Secure My Data!

## Notes

- The \_secretKey should remain confidential to ensure the security of the encrypted text.

- Ensure that you use the same \_secretKey for encryption and decryption
