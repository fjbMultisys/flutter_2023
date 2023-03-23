# Camera View

REF: https://medium.com/@fernnandoptr/how-to-use-camera-in-flutter-flutter-camera-package-44defe81d2da


//================================================================================

CAMERA VIEW

//================================================================================ 


Implementing Segue VC 
``` 
onPressed: () async {
                        await availableCameras().then((value) => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => KYCTakeSelfieView(cameras: value))));
                      },

``` 
- -

CAMERA VIEW

``` 
import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class KYCTakeSelfieView extends StatefulWidget {
  const KYCTakeSelfieView({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  State<KYCTakeSelfieView> createState() => _KYCTakeSelfieViewState();
}

class _KYCTakeSelfieViewState extends State<KYCTakeSelfieView> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = false;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => KYCConfirmSelfieView(picture: picture)
          )
      );
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(children: [
            (_cameraController.value.isInitialized)
                ? CameraPreview(_cameraController)
                : Container(
                color: Colors.black,
                child: const Center(child: CircularProgressIndicator())),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.20,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24)),
                      color: Colors.black),
                  child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Expanded(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 30,
                          icon: Icon(
                              _isRearCameraSelected
                                  ? CupertinoIcons.switch_camera
                                  : CupertinoIcons.switch_camera_solid,
                              color: Colors.white),
                          onPressed: () {
                            setState(
                                    () =>
                                _isRearCameraSelected = !_isRearCameraSelected);
                            initCamera(widget.cameras![_isRearCameraSelected
                                ? 0
                                : 1]);
                          },
                        )),
                    Expanded(
                        child: IconButton(
                          onPressed: takePicture,
                          iconSize: 50,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.circle, color: Colors.white),
                        )),
                    const Spacer(),
                  ]),
                )),
          ]),
        ));
  }
}



```


//================================================================================

IMAGE PREVIEW

//================================================================================ 



``` 

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


```
