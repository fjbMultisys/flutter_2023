import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class KYCConfirmSelfieView extends StatelessWidget {
  const KYCConfirmSelfieView({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  @override
  Widget build(BuildContext context) {

    void _handleOnPressedBack() {
      Navigator.of(context).pop();
    }

    void _handleOnPressedNext() {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const KYCValidIDView()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upgrade to Premium'),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 153, 204, 102),
        leading: IconButton(
            splashRadius: 25,
            onPressed: () => _handleOnPressedBack(),
            icon: const Icon(Icons.arrow_back_sharp,
                color: Colors.white)),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
          Text(picture.name),
          const SizedBox(height: 30),
          Column(
            children: [
              AppButton(
                buttonType: ButtonType.filled,
                buttonState: ButtonState.enabled,
                text: "Continue",
                color: const Color.fromARGB(255, 153, 204, 102),
                onPressed: () => _handleOnPressedNext(),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

