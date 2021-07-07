import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:get/get.dart';
import '../common/size_config.dart';
import '../common/theme.dart';
import '../widgets/image_option_button.dart';
import '../widgets/linear_gradient_container.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _fileName;
  File _image;
  bool _isModelStartLoaded = false;
  List _output;

  void pickGalleryImage(bool isCameraClicked) async {
    var image;
    if (isCameraClicked) {
      image = await ImagePicker().getImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker().getImage(source: ImageSource.gallery);
    }

    if (image == null) return null;

    setState(() {
      _image = File(image.path);
      _fileName = image.path.split('/').last;
    });
    await classifyImage(_image);
  }

  classifyImage(File image) async {
    setState(() => _isModelStartLoaded = true);
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print(output);
    setState(() {
      _isModelStartLoaded = false;
      _output = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model.tflite',
      labels: 'assets/labels.txt',
    );
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget catDogHeaderContainer = Container(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.safeAreaVertical),
      width: double.infinity,
      height: SizeConfig.screenHeight / 2.5,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff334CA1),
            offset: Offset(0, 4),
            blurRadius: 9,
          ),
        ],
      ),
      child: _image == null
          ? Image.asset('assets/catdog.png')
          : Image.file(_image),
    );

    return LinearGradientContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _isModelStartLoaded
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  catDogHeaderContainer,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _output == null
                              ? 'Cat & Dog\nClassification'
                              : 'Result:\n${_output[0]['label']}',
                          textAlign: TextAlign.center,
                          style: titleStyle,
                        ),
                        SizedBox(
                          height: (SizeConfig.safeBlockVertical * 3.9)
                              .roundToDouble(),
                        ),
                        Text(
                          'Choose Image by',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: (SizeConfig.safeBlockHorizontal * 4.4)
                                .roundToDouble(),
                          ),
                        ),
                        SizedBox(
                          height: (SizeConfig.safeBlockVertical * 1.3)
                              .roundToDouble(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ImageOptionButton(
                              logoLocation: 'assets/camera.png',
                              onTap: () => pickGalleryImage(true),
                            ),
                            ImageOptionButton(
                              logoLocation: 'assets/gallery.png',
                              onTap: () => pickGalleryImage(false),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: (SizeConfig.safeBlockVertical * 3.9)
                              .roundToDouble(),
                        ),
                        Text(
                          'File Name',
                          style: TextStyle(
                            fontSize: (SizeConfig.safeBlockHorizontal * 4.4)
                                .roundToDouble(),
                            color: whiteColor,
                          ),
                        ),
                        SizedBox(
                          height: (SizeConfig.safeBlockVertical * 1.3)
                              .roundToDouble(),
                        ),
                        Container(
                          height: (SizeConfig.safeBlockVertical * 6.5)
                              .roundToDouble(),
                          margin: EdgeInsets.symmetric(
                            horizontal: (SizeConfig.safeBlockHorizontal * 5.56)
                                .roundToDouble(),
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              _fileName ?? 'No image selected.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize:
                                    (SizeConfig.safeBlockHorizontal * 3.89)
                                        .roundToDouble(),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.dialog(
                            AlertDialog(
                              title: Center(
                                child: Text(
                                  'How to Use',
                                  style: titleDialogStyle,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Just choose your image by gallery or camera. Then the app will classify it as a cat or dog.',
                                    textAlign: TextAlign.justify,
                                    style: contentDialogStyle,
                                  ),
                                  SizedBox(
                                    height:
                                        (SizeConfig.safeBlockVertical * 2.92)
                                            .roundToDouble(),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => Get.back(),
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                        fontSize:
                                            (SizeConfig.safeBlockHorizontal *
                                                    3.89)
                                                .roundToDouble(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            barrierDismissible: false,
                          ),
                          child: Text(
                            'How to use',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: whiteColor,
                              fontSize: (SizeConfig.safeBlockHorizontal * 4.4)
                                  .roundToDouble(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
