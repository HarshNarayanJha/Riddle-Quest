import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class SquareCameraPreview extends StatelessWidget {
  const SquareCameraPreview({
    super.key,
    required this.size,
    required CameraController cameraController,
  }) : _cameraController = cameraController;

  final Size size;
  final CameraController _cameraController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.width / 1.2,
        height: size.width / 1.2,
        child: ClipRect(
          child: OverflowBox(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                width: size.width / 1.5,
                height: size.width /
                    _cameraController.value.aspectRatio,
                child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CameraPreview(_cameraController),
                      Center(
                          child: TextButton.icon(
                        icon: const Icon(
                          Icons.touch_app_rounded,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Tap to Capture",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight:
                                  FontWeight.w900),
                        ),
                        onPressed: null,
                      ))
                    ]),
              ),
            ),
          ),
        ),
      );
  }
}
