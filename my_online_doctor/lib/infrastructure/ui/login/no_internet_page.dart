import 'package:flutter/material.dart';
import 'package:my_online_doctor/infrastructure/core/constants/image_constants.dart';
import 'package:my_online_doctor/infrastructure/ui/components/base_ui_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/button_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/reusable_widgets.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/colors.dart';
import 'package:my_online_doctor/main.dart';

// ignore: use_key_in_widget_constructors
class NoInternetPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return BaseUIComponent(
      body: _renderBody(context),
      appBar: _renderAppBar(context),
      bottomNavigationBar: _renderBottomNavigationBar(context),
    );
  }


   ///Widget AppBar
  PreferredSizeWidget _renderAppBar(BuildContext context) => AppBar( 
    backgroundColor: colorPrimary,
    title: const Text('My Online Doctor'),
    centerTitle: true,
  );

  
  //Widget Bottom Navigation Bar
  Widget _renderBottomNavigationBar(BuildContext context) => 
    Container(width: double.infinity, height: MediaQuery.of(context).size.height * 0.05, color: colorSecondary);


  Widget _renderBody(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment:  CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      renderImageView(context, ImagesConstant.noInternet.image),
      _renderRegisterButton(context),
    ],
  );
  }


  Widget _renderRegisterButton(BuildContext context) => SizedBox(
    width: MediaQuery.of(context).size.width * 0.7,
    child: ButtonComponent(
      title: 'Volver a Cargar',
      style: ButtonComponentStyle.primary,
      actionButton: () => runApp(const MyOnlineDoctorApp()),
    ));


}