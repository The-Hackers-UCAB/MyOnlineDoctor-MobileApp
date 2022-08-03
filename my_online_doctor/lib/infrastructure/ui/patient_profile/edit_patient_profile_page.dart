import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_doctor/infrastructure/ui/components/button_header.dart';
import 'package:my_online_doctor/infrastructure/ui/components/profile_picture_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/textfield_component.dart';

import '../../../domain/enumerations/genre_enum.dart';
import '../../core/constants/text_constants.dart';
import '../styles/colors.dart';
import 'mockup_patient.dart';

class EditPatientProfilePage extends StatefulWidget {
  EditPatientProfilePage({Key? key}) : super(key: key);

  @override
  State<EditPatientProfilePage> createState() => _EditPatientProfilePageState();
}

class _EditPatientProfilePageState extends State<EditPatientProfilePage> {
  User user = ExampleUser.exampleUser;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(TextConstant.modifyProfileTitle.text),
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

  Widget _body(BuildContext context) => ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 24),
                ProfilePictureComponent(
                  gender: user.gender,
                  isEdit: true,
                  onClicked: () async {},
                ),
                SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Primer Nombre',
                  text: user.firstName,
                  onChanged: (firstName) {},
                ),
                SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Segundo Nombre',
                  text: user.middleName,
                  onChanged: (middleName) {},
                ),
                SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Primer Apellido',
                  text: user.firstSurname,
                  onChanged: (firstSurname) {},
                ),
                SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Segundo Apellido',
                  text: user.secondSurname,
                  onChanged: (secondSurname) {},
                ),
                SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Altura',
                  text: user.height.toString(),
                  onChanged: (height) {},
                ),
                SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Peso',
                  text: user.weight.toString(),
                  onChanged: (weight) {},
                ),
                SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Telefono',
                  text: user.phoneNumber,
                  onChanged: (phoneNumber) {},
                ),
                SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Alergias',
                  text: user.allergies,
                  maxLines: 5,
                  onChanged: (allergies) {},
                ),
                SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Antecedentes',
                  text: user.background,
                  maxLines: 5,
                  onChanged: (background) {},
                ),
                SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Cirugias',
                  text: user.surgeries,
                  maxLines: 5,
                  onChanged: (surgeries) {},
                ),
                SizedBox(height: 24),
                ButtonWidget(
                  text: 'Guardar Cambios',
                  onClicked: () async {/* cuadro de dialogo */},
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      );
}
