import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_doctor/infrastructure/ui/components/button_header.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/theme.dart';

import '../../core/constants/min_max_constants.dart';
import '../../core/constants/text_constants.dart';
import '../components/reusable_widgets.dart';
import '../components/text_field_component.dart';
import '../styles/colors.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _textEmailController = TextEditingController();
  final TextEditingController _textPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstant.forgotMyPassword.text),
        centerTitle: true,
        backgroundColor: colorPrimary,
        elevation: 4.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: colorBlack,
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          renderLogoImageView(context, fullLogo: false),
          Text(
            'Ingrese su correo y la nueva contraseña',
            style: mainTheme().textTheme.headline6,
          ),
          _renderPatientEmailTextField(),
          _renderNewPatientPasswordTextField(),
          _renderConfirmNewPatientPasswordTextField(),
          ButtonWidget(
            text: 'Cambiar Contraseña',
            onClicked: () {},
          )
        ],
      );

  Widget _renderPatientEmailTextField() => TextFieldBaseComponent(
        hintText: 'Correo Electrónico',
        errorMessage: 'Ingrese el correo',
        minLength: MinMaxConstant.minLengthEmail.value,
        maxLength: MinMaxConstant.maxLengthEmail.value,
        textEditingController: _textEmailController,
        keyboardType: TextInputType.emailAddress,
      );

  Widget _renderNewPatientPasswordTextField() => TextFieldBaseComponent(
        hintText: 'Nueva Contraseña',
        errorMessage: 'Ingrese la nueva contraseña',
        minLength: MinMaxConstant.minLengthPassword.value,
        maxLength: MinMaxConstant.maxLengthPassword.value,
        textEditingController: _textPasswordController,
        obscureText: true,
        keyboardType: TextInputType.text,
      );

  Widget _renderConfirmNewPatientPasswordTextField() => TextFieldBaseComponent(
        hintText: 'Confirme Nueva Contraseña',
        errorMessage: 'La contraseña no coincide',
        minLength: MinMaxConstant.minLengthPassword.value,
        maxLength: MinMaxConstant.maxLengthPassword.value,
        textEditingController: _textPasswordController,
        obscureText: true,
        keyboardType: TextInputType.text,
      );
}
