import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_doctor/application/bloc/appointment_request/appointment_request_bloc.dart';
import 'package:my_online_doctor/domain/models/appointment/request_appointment_model.dart';
import 'package:my_online_doctor/domain/models/doctor/doctor_request_model.dart';
import 'package:my_online_doctor/infrastructure/ui/components/base_ui_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/loading_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/reusable_widgets.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/theme.dart';
import '../components/button_component.dart';
import '../styles/colors.dart';

class RequestAppointmentPage extends StatelessWidget {

  static const routeName = '/request_appointment';

  RequestAppointmentModel appointment;
  
  RequestAppointmentPage({Key? key, required this.appointment}) : super(key: key);


  final TextEditingController symptomsController = TextEditingController();


  @override
  Widget build(BuildContext context){
    return BlocProvider(
      lazy:  false,
      create: (context) => AppointmentRequestBloc(),
      child: BlocBuilder<AppointmentRequestBloc, AppointmentRequestState>(
        builder: (context, state) {
          return BaseUIComponent(
            appBar: _renderAppBar(context),
            body: _body(context, state),
            bottomNavigationBar: _renderBottomNavigationBar(context),
          );
        },
      ),
    );
  }



  PreferredSizeWidget _renderAppBar(BuildContext context) => AppBar(
    backgroundColor: colorPrimary,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    )
  );


  //Widget Bottom Navigation Bar
  Widget _renderBottomNavigationBar(BuildContext context) => 
    Container(width: double.infinity, height: MediaQuery.of(context).size.height * 0.05, color: colorSecondary);   


    //Widget Body
  Widget _body(BuildContext context, AppointmentRequestState state) {
    
    if(state is AppointmentRequestStateInitial) {
      context.read<AppointmentRequestBloc>().add(AppointmentRequestEventFetchBasicData(RequestAppointmentModel(

      )

      ));
    }

    return Stack(
      children: [
        if(state is! AppointmentRequestStateInitial) _appointmentRequestStreamBuilder(context),
        if(state is AppointmentRequestStateInitial || state is AppointmentRequestStateLoading) const LoadingComponent(),
      ],
    );
  }


  //StreamBuilder for the Login Page
  Widget _appointmentRequestStreamBuilder(BuildContext builderContext) => StreamBuilder<RequestAppointmentModel>(
    stream: builderContext.read<AppointmentRequestBloc>().streamAppointmentRequest,
    builder: (BuildContext context, AsyncSnapshot<RequestAppointmentModel> snapshot) {

      if(snapshot.hasData) {

        return _renderAppointmentBody(context, snapshot.data!);
        
      } 

      return const LoadingComponent();
    }
  );



  Widget _renderAppointmentBody(BuildContext context, RequestAppointmentModel newAppointment) { 
    
    appointment = newAppointment;

    return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Center(
            child: Image.asset('assets/images/doctor_logo.png'
              , width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.2, 
            ),
          ),
          _buildSymptomsTextField(),
          heightSeparator(context, 0.2),
          ButtonComponent(
            title: 'Solicitar Cita',
            actionButton: () {
              if (symptomsController.text == '') _showAlertDialog(context);
            }
          ),   
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