import 'package:flutter/material.dart';
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
  PreferredSizeWidget _renderAppBar(BuildContext context) => AppBar( backgroundColor: colorPrimary);

  
  //Widget Bottom Navigation Bar
  Widget _renderBottomNavigationBar(BuildContext context) => 
    Container(width: double.infinity, height: MediaQuery.of(context).size.height * 0.05, color: colorSecondary);


  Widget _renderBody(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment:  CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      renderLogoImageView(context, fullLogo: true),
      heightSeparator(context, 0.010),
      _renderNoInternetText(context),
      heightSeparator(context, 0.025),
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

  Widget _renderNoInternetText(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 32.0, right: 32.0),
    child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
              child: Text(
            'La operación esta tomando mucho tiempo en completarse. Por favor, verifique su conexión de internet'.toString().toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(color: colorBlack),
          )),
        ],
      )
    ]),
  );


}