import 'dart:async';

import 'package:cat_dog_clf/common/size_config.dart';
import 'package:cat_dog_clf/common/theme.dart';
import 'package:cat_dog_clf/ui/home_page.dart';
import 'package:cat_dog_clf/widgets/linear_gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Get.off(() => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return LinearGradientContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: (SizeConfig.safeBlockVertical * 19.5).roundToDouble(),
              ),
              SizedBox(
                height: (SizeConfig.safeBlockVertical * 0.65).roundToDouble(),
              ),
              Text(
                'Cat & Dog\nClassification',
                textAlign: TextAlign.center,
                style: titleStyle,
              ),
            ],
          ),
        ),
      ),
    );

    // return SplashScreen(
    //   seconds: 8,
    //   navigateAfterSeconds: HomePage(),
    //   image: Image.asset('assets/logo.png'),
    //   photoSize: (SizeConfig.safeBlockVertical * 16.26).roundToDouble(),
    //   title: Text(
    //     'Cat & Dog\nClassification',
    //     textAlign: TextAlign.center,
    //     style: titleStyle,
    //   ),
    //   loaderColor: whiteColor,
    //   gradientBackground: gradientBackground,
    // );
  }
}
