import 'package:flutter/material.dart';
import 'package:my_online_doctor/infrastructure/core/constants_manager.dart';

import '../styles/colors.dart';
import 'image_view_component.dart';

Widget progressIndicator() =>
    const Center(child: CircularProgressIndicator(color: colorPrimary));

Widget renderLogoImageView(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 40),
    height: MediaQuery.of(context).size.width * (40 / 100),
    width: double.infinity,
    child: ImageViewComponent(ImagesConstant.logo.image));


Widget heightSeparator(BuildContext context, double heightPercentage) => SizedBox(
      height: MediaQuery.of(context).size.height * heightPercentage,
    );
  