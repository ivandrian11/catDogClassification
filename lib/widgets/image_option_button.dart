import 'package:cat_dog_clf/common/size_config.dart';
import 'package:cat_dog_clf/common/theme.dart';
import 'package:flutter/material.dart';

class ImageOptionButton extends StatelessWidget {
  final Function onTap;
  final String logoLocation;

  ImageOptionButton({this.logoLocation, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(
          (SizeConfig.safeBlockHorizontal * 1.1).roundToDouble(),
        ),
        width: (SizeConfig.safeBlockHorizontal * 27.78).roundToDouble(),
        height: (SizeConfig.safeBlockHorizontal * 27.78).roundToDouble(),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(logoLocation),
      ),
    );
  }
}
