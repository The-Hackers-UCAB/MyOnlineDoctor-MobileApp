import 'package:flutter/material.dart';

import '../components/button_component.dart';
import '../components/button_header.dart';
import '../styles/colors.dart';

class RequestAppointmentPage extends StatefulWidget {
  RequestAppointmentPage({Key? key}) : super(key: key);

  @override
  State<RequestAppointmentPage> createState() => _RequestAppointmentPageState();
}

class _RequestAppointmentPageState extends State<RequestAppointmentPage> {
  DateTime initialDate = DateTime.now();
  TimeOfDay initialTime = const TimeOfDay(hour: 7, minute: 0);
  late DateTime date;
  late TimeOfDay time;

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
            const SizedBox(height: 30),
            ButtonHeaderWidget(
                title: 'Fecha',
                text:
                    'Seleccione la fecha para su cita', //aqui se deberia mostrar la fecha DESPUES de que se selecciono (cambio de estado)
                onClicked: () async {
                  DateTime? requestedDate = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: initialDate,
                    lastDate: initialDate.add(const Duration(days: 30)),
                  );

                  // si el usuario presiona 'CANCEL'
                  if (requestedDate == null) return;

                  // si el usuario presiona 'OK' se cambia el estado
                  setState(() => date = requestedDate);
                }),
            const SizedBox(height: 15),
            ButtonHeaderWidget(
                title: 'Hora',
                text:
                    'Seleccione la hora para su cita', //aqui se deberia mostrar la hora DESPUES de que se selecciono (cambio de estado)
                onClicked: () async {
                  TimeOfDay? requestedTime = await showTimePicker(
                    context: context,
                    initialTime: initialTime,
                  );

                  // si el usuario presiona 'CANCEL'
                  if (requestedTime == null) return;

                  // si el usuario presiona 'OK' se cambia el estado
                  setState(() => time = requestedTime);
                }),
            const SizedBox(height: 15),
            // DropdownComponent(
            //   model: DropdownComponentModel(
            //     dropDownLists: ['Virtual', 'Presencial'],
            //     itemDropdownSelected: appointmentType,
            //   ),
            // ),
            ButtonHeaderWidget(
                //esto en teoria se deberia sustituir por el dropdowncomponent, excepto que se consiga otra alternativa y se coloque dentro del action button
                title: 'Modalidad',
                text: 'Seleccione la modalidad de su cita',
                onClicked: () {}),
            const SizedBox(height: 50),
            ButtonComponent(title: 'Solicitar Cita', actionButton: () {}),
          ],
        ),
      ),
    );
  }
}
