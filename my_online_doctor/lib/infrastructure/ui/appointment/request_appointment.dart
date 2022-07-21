import 'package:flutter/material.dart';
import 'package:my_online_doctor/domain/models/doctor/doctor_request_model.dart';
import 'package:my_online_doctor/infrastructure/ui/components/reusable_widgets.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/theme.dart';
import '../components/button_component.dart';
import '../styles/colors.dart';

class RequestAppointmentPage extends StatelessWidget {

  static const routeName = '/request_appointment';

  // DoctorRequestModel doctor;
  
  // RequestAppointmentPage({Key? key, required this.doctor}) : super(key: key);


  TextEditingController symptomsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitud de Cita'),
        backgroundColor: colorPrimary,
        centerTitle: true,
        elevation: 4.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: colorWhite,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: renderLogoImageView(context),
            ),
            _buildSymptomsTextField(),
            const SizedBox(height: 10),
            ButtonComponent(
                title: 'Solicitar Cita',
                actionButton: () {
                  if (symptomsController.text == '') _showAlertDialog(context);
                  //else {} aqui se dispara el crear la solicitud
                }),
          ],
        ),
      ),
    );
  }

  Future _showAlertDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Recuadro de Sintomas Vacio',
            style: mainTheme().textTheme.headline1,
          ),
          content: Text(
            'No se puede solicitar una cita si no especifica sus sintomas',
            style: mainTheme().textTheme.headline4,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('REGRESAR'),
            ),
          ],
        ),
      );

  Widget _buildSymptomsTextField() => TextField(
        controller: symptomsController,
        decoration: InputDecoration(
          hintText: 'Dolor de vida...',
          labelText: 'Sintomas',
          labelStyle: mainTheme().textTheme.labelMedium,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: colorPrimary,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: colorPrimary),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        minLines: 1,
        maxLines: 5,
        maxLength: 280,
        style: mainTheme().textTheme.bodyMedium,
        autofocus: true,
      );
}