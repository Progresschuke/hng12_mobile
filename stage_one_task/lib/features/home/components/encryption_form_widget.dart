import 'package:flutter/services.dart';

import '../../../_lib.dart';

class EncryptFormWidget extends StatefulWidget {
  const EncryptFormWidget({
    super.key,
  });

  @override
  State<EncryptFormWidget> createState() => _EncryptFormWidgetState();
}

class _EncryptFormWidgetState extends State<EncryptFormWidget> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> textEditingControllers =
      List.generate(2, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(2, (index) => FocusNode());
  String? encryptedText;

  void clearControllers() {
    for (var controller in textEditingControllers) {
      controller.clear();
    }
  }

  void disposeControllers() {
    for (var controller in textEditingControllers) {
      controller.dispose();
    }
  }

  void unfocusTextfields() {
    for (var focusNode in focusNodes) {
      focusNode.unfocus();
    }
  }

  void disposeFocusNodes() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
  }

  @override
  void dispose() {
    disposeControllers();
    disposeFocusNodes();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputFormBox(
            hintText: "Enter secret key",
            focusNode: focusNodes[0],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => FormValidator.validateKey(value),
            textEditingController: textEditingControllers[0],
          ),
          SizedBox(height: size.height * 0.01),
          InputFormBox(
            hintText: "Enter text",
            focusNode: focusNodes[1],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => FormValidator.notEmpty(value),
            textEditingController: textEditingControllers[1],
          ),
          SizedBox(height: size.height * 0.05),
          if (encryptedText != null)
            Visibility(
                visible: encryptedText != null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Your encrypted text".text.p.w7.center,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.8,
                          child: encryptedText!.text.p1
                              .textColor(AppColors.primary)
                              .copyWith(
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                maxLines: 10,
                              ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(
                                ClipboardData(text: encryptedText!));
                          },
                          child: const Icon(
                            Icons.copy,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          SizedBox(height: size.height * 0.1),
          CustomElevatedButton(
            text: "Encrypt",
            onTap: () {
              unfocusTextfields();

              if (_formKey.currentState!.validate()) {
                final encryption =
                    CustomEncryption(textEditingControllers[0].text.trim());
                final text =
                    encryption.encrypt(textEditingControllers[1].text.trim());

                setState(() {
                  encryptedText = text;
                  print(encryptedText);
                });
              }
            },
          ),
          SizedBox(height: size.height * 0.01),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DecryptView(),
                ),
              );
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'Have an encrypted code?',
                style: TextStyle(fontSize: 14, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Decrypt',
                    style: TextStyle(color: AppColors.primary, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: size.height * 0.05),
        ],
      ),
    );
  }
}
