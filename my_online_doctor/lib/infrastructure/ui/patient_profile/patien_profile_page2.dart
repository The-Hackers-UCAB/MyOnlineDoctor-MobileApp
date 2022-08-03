import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_online_doctor/domain/enumerations/genre_enum.dart';
import 'package:my_online_doctor/infrastructure/core/constants/text_constants.dart';
import 'package:my_online_doctor/infrastructure/ui/components/profile_picture_component.dart';
import 'package:my_online_doctor/infrastructure/ui/patient_profile/edit_patient_profile_page.dart';
import 'package:my_online_doctor/infrastructure/ui/patient_profile/mockup_patient.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/theme.dart';

import '../styles/colors.dart';

class PatientProfilePage2 extends StatelessWidget {
  static String routeName = "/profile";

  final User user = ExampleUser.exampleUser;

  PatientProfilePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstant.profileTitle.text),
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

  Widget _body(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          child: Column(
            children: [
              const SizedBox(height: 24),
              ProfilePictureComponent(
                gender: user.gender,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => EditPatientProfilePage()),
                  );
                },
              ),
              const SizedBox(height: 24),
              _buildName(context),
              const SizedBox(height: 15),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 209, 209, 209),
                            blurRadius: 20,
                            offset: const Offset(0, -1),
                          ),
                        ],
                        color: colorWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          _buildPatientData(context),
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            child: const Divider(),
                          ),
                          const SizedBox(height: 5),
                          _buildPatientBackground(context),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildName(BuildContext context) => Column(
        children: [
          Text(
            '${user.firstName} ${user.firstSurname}',
            style: mainTheme().textTheme.headline1,
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: mainTheme().textTheme.headline4,
          )
        ],
      );

  Widget _buildPatientData(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton(context, '${_calcPatientAge(user.birthdate)}', 'Edad'),
          _buildDivider(context),
          _buildButton(
              context,
              user.gender == Genre.male ? 'Masculino' : 'Femenino',
              'Genero'),
          _buildDivider(context),
          _buildButton(context, '${user.height}cm', 'Altura'),
          _buildDivider(context),
          _buildButton(context, '${user.weight}kg', 'Peso'),
        ],
      );

  Widget _buildDivider(BuildContext context) => const SizedBox(
        height: 24,
        child: VerticalDivider(),
      );

  int _calcPatientAge(DateTime patientBirthday) {
    DateTime today = DateTime.now();
    int actualYear = today.year;
    int birthdayPatientYear = patientBirthday.year;
    int age = actualYear - birthdayPatientYear;

    if (today.month == patientBirthday.month) {
      if (today.day < patientBirthday.day) {
        age = age - 1;
      }
    }

    return age;
  }

  Widget _buildButton(BuildContext context, String data, String dataTag) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            data,
            style: mainTheme().textTheme.displayMedium,
          ),
          const SizedBox(height: 2),
          Text(
            dataTag,
            style: mainTheme().textTheme.bodyText2,
          ),
        ],
      );

  Widget _buildPatientBackground(BuildContext context) => Column(
        children: [
          _buildPatientInfo(context, user.allergies, 'Alergias'),
          const SizedBox(height: 20),
          _buildPatientInfo(context, user.background, 'Antecedentes'),
          const SizedBox(height: 20),
          _buildPatientInfo(context, user.surgeries, 'Cirugias'),
          const SizedBox(height: 20),
          _buildPatientInfo(context, user.phoneNumber, 'Numero de Contacto'),
        ],
      );

  Widget _buildPatientInfo(BuildContext context, String info, String tittle) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            Text(
              tittle,
              style: mainTheme().textTheme.headline1,
            ),
            const SizedBox(height: 10),
            Text(
              info,
              style: mainTheme().textTheme.bodyText2,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      );
}
