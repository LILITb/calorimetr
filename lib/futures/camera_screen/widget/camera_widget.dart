import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../ui/ui.dart';


class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key,}) : super(key: key);

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;
  XFile? cameraPicture;
  Future? future;

  @override
  void initState() {
    super.initState();
    //future = initCamera(widget.cameras![0]);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      // await _cameraController.setFlashMode(FlashMode.off);
      // await _cameraController.setFlashMode(FlashMode.torch);
      // await _cameraController.setFlashMode(FlashMode.off);
      await _cameraController.value.isInitialized;

      XFile picture = await _cameraController.takePicture();
      // var wait =await _cameraController.value.isPreviewPaused;
      // print(wait);
      setState(() {
        cameraPicture = picture;
        //CropImagePage.of(context)?.cameraPictures = cameraPicture;
        _isRearCameraSelected = false;
      });
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
        cameraDescription, ResolutionPreset.high,
        enableAudio: false);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {
          _isRearCameraSelected = true;
        });
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildFutureBuilder();
  }

  FutureBuilder buildFutureBuilder() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot async) {
        if (async.connectionState == ConnectionState.active ||
            async.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        if (async.connectionState == ConnectionState.done) {
          return cameraBody(context);
        }
        return null!;
      },
      future: future,
    );
  }

  Widget cameraBody(context) {
    return Column(children: [
      (_cameraController.value.isInitialized)
          ? Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          // constraints: BoxConstraints(maxHeight: 350),
          child: CameraPreview(_cameraController))
          : Container(
          color: Colors.black,
          child: const Center(child: CircularProgressIndicator())),
      Align(
        alignment: Alignment.bottomCenter,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: 40,),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  // ElevatedButton styles
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  padding: const EdgeInsets.fromLTRB(13, 16, 13, 16),
                ),
                onPressed: () {
                  setState(() {
                    takePicture();
                  });
                },
                label: const Text(
                  "TAKE PHOTO",
                  style: TextStyle(
                      color: Color.fromRGBO(70, 81, 99, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
                icon: SvgPicture.asset(
                  'assets/icons/camera.svg',
                  height: 20,
                ),
              ),
            ]),
      ),
    ]);
  }
}
