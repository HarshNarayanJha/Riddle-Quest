import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riddle_quest_app/provider/room_data_provider.dart';
import 'package:riddle_quest_app/resources/socket_helper.dart';
import 'package:riddle_quest_app/widgets/custom_button.dart';
import 'package:riddle_quest_app/widgets/responsive.dart';
import 'package:riddle_quest_app/widgets/riddle_quest_app_bar.dart';
import 'package:riddle_quest_app/widgets/square_camera_preview.dart';

class ItemScanPage extends StatefulWidget {
  static const String routeName = '/home/lobby/item_scan';
  const ItemScanPage({super.key});

  @override
  State<ItemScanPage> createState() => _ItemScanPageState();
}

class _ItemScanPageState extends State<ItemScanPage> {
  final _socketHelper = SocketHelper();
  bool cameraEnabled = false;
  late CameraController _cameraController;
  List<int> cropData = [0, 0, 0, 0];

  @override
  void initState() {
    super.initState();
    initCameras();

    Provider.of<RoomDataProvider>(context).updateReceivedRiddle(true);

    _socketHelper.scannedImageListener(context);
    _socketHelper.errorOccurredListener(context);
  }

  @override
  void dispose() {
    _socketHelper
        .destroyRoom(Provider.of<RoomDataProvider>(context).roomData['id']);
    _socketHelper.removeScannedImageListener();
    _socketHelper.removeErrorOccurredListener();
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> initCameras() async {
    setState(() {
      cameraEnabled = false;
    });
    List<CameraDescription> cameras = await availableCameras();
    // print("############ Cameras: " + cameras.toList().toString());
    _cameraController = CameraController(cameras[0], ResolutionPreset.low);
    await _cameraController.initialize();
    // _cameraController.lockCaptureOrientation(DeviceOrientation.landscapeRight)
    if (!mounted) {
      return;
    }
    setState(() {
      cameraEnabled = true;
    });
  }

  Future<bool> _onBack(
      BuildContext context, RoomDataProvider roomDataProvider) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert!'),
          content: const Text(
              'You sure want to go back? Game will disconnect for both of the players!'),
          actions: <Widget>[
            TextButton(
              child: const Text('Stay in the loop'),
              onPressed: () {
                print("Stay in the room");
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Destroy the room'),
              onPressed: () {
                print("Destroy the room");
                _socketHelper.destroyRoom(roomDataProvider.roomData['id']);
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    final size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        bool canPop = await _onBack(context, roomDataProvider);
        if (canPop) {
          if (context.mounted) {
            Navigator.pop(context);
          }
        }
      },
      child: Scaffold(
        appBar: const RiddleQuestAppBar(),
        body: SingleChildScrollView(
          child: Responsive(
              maxWidth: 900,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.04),
                    Text(
                      "Now Click Pictures of 5 common ${(roomDataProvider.roomData['environmentType'] == 0) ? 'Indoor' : 'Outdoor'} Items around you",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "${5 - roomDataProvider.myPlayer.imagesDone}/5 left",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.grey),
                    ),
                    SizedBox(height: size.height * 0.02),
                    GestureDetector(
                      onTap: (roomDataProvider.receivedRiddle) ? () async {
                        XFile image = await _cameraController.takePicture();
                        print("Took Picture $image");
                        _socketHelper.scanImage(
                            context,
                            image,
                            roomDataProvider.roomData['id'],
                            roomDataProvider.didCreateRoom);
                        // initCameras();
                        // print(image.path);
                        // _cameraController.resumePreview();
                      } : null,
                      child: (cameraEnabled)
                          ? SquareCameraPreview(
                              size: size, cameraController: _cameraController)
                          : Container(
                              width: size.width / 1.2,
                              height: size.width / 1.2,
                              decoration:
                                  const BoxDecoration(color: Colors.black)),
                    ),
                    SizedBox(height: size.height * 0.04),
                    Text(
                      roomDataProvider.currentItemName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(height: size.height * 0.04),
                    Text(roomDataProvider.currentRiddle,
                        textAlign: TextAlign.center),
                    SizedBox(height: size.height * 0.04),
                    CustomButton(
                        onTap: (roomDataProvider.myPlayer.imagesDone == 5) ? () {} : null, text: "Next"),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
