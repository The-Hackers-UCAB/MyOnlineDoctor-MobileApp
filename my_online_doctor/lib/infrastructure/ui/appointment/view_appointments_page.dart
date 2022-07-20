//Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Project imports:
import 'package:my_online_doctor/application/bloc/appointment/appointment_bloc.dart';
import 'package:my_online_doctor/domain/models/appointment/request_appointment_model.dart';
import 'package:my_online_doctor/infrastructure/core/constants/min_max_constants.dart';
import 'package:my_online_doctor/infrastructure/core/constants/text_constants.dart';
import 'package:my_online_doctor/infrastructure/ui/components/base_ui_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/button_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/loading_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/reusable_widgets.dart';
import 'package:my_online_doctor/infrastructure/ui/components/show_error_component.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/colors.dart';

class ViewAppointmentsPage extends StatelessWidget{

  static const routeName = '/view_appointments';

  ViewAppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy:  false,
      create: (context) => AppointmentBloc(),
      child: BlocBuilder<AppointmentBloc, AppointmentState>(
        builder: (context, state) {
          return BaseUIComponent(
            appBar: _renderAppBar(context),
            body: _body(context, state),
          );
        },
      ),
    );
  }

  ///Widget AppBar
  PreferredSizeWidget _renderAppBar(BuildContext context) => AppBar( 
    backgroundColor: colorPrimary,
    title: const Text('Citas Médicas'),
    centerTitle: true,
  );


  //Widget Body
  Widget _body(BuildContext context, AppointmentState state) {
    
    if(state is AppointmentStateInitial) {
      context.read<AppointmentBloc>().add(AppointmentEventFetchBasicData());
    }

    return Stack(
      children: [
        if(state is! AppointmentStateInitial) _viewAppointmentsRenderView(context),
        if(state is AppointmentStateInitial || state is AppointmentStateLoading) const LoadingComponent(),
      ],
    );
  }


  Widget _viewAppointmentsRenderView(context){

    // return Padding(
    //   padding: EdgeInsets.only(top: 20, bottom: 20),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     mainAxisSize: MainAxisSize.max,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       _appointmentStreamBuilder(context),
    //       _requestAppointmentRenderButton(context),
    //     ],
    //   ),
    // );

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding: generalMarginView,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: _appointmentStreamBuilder(context),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.12,
            margin: generalMarginView,
            child:_requestAppointmentRenderButton(context),
          ) 
        ),
        
        // heightSeparator(context, 0.05),
        // _requestAppointmentRenderButton(context)
      ],
    );

  }

  //StreamBuilder for the Login Page
  Widget _appointmentStreamBuilder(BuildContext builderContext) => StreamBuilder<List<RequestAppointmentModel>>(
    stream: builderContext.read<AppointmentBloc>().streamAppointment,
    builder: (BuildContext context, AsyncSnapshot<List<RequestAppointmentModel>> snapshot) {

      if(snapshot.hasData) {
        if(snapshot.data!.isNotEmpty) {

          return _renderMainBody(context, snapshot.data!);
          // return const Center(child: CircularProgressIndicator(color: colorError,));

        } else {
          return Container(
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
            child: const ShowErrorComponent(errorImagePath:'assets/images/request_your_appointment.png')
          );
        }
      } 

      return const LoadingComponent();
    }
  );


  Widget _requestAppointmentRenderButton(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 25),
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.065,
    child:  ButtonComponent(
      title: TextConstant.requestAppointment.text,
      // actionButton:  () => _signIn(context),
    )
  );


  Widget _renderMainBody(BuildContext context, List<RequestAppointmentModel> data) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 20),
    child: ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (listContext, index) => _renderAppointmentItem(context, data[index]),
    ),
    
  );



  Widget _renderAppointmentItem(BuildContext context, RequestAppointmentModel item) {

    late Color statusColor;
    
      switch(item.status){
        case 'COMPLETADA':
        case 'INICIADA':
          statusColor = colorGreen;
          break;

        case 'SOLICITADA':
        case 'AGENDADA':
        case 'ACEPTADA':
          statusColor = colorYellow;
          break;

        case 'RECHAZADA':
        case 'CANCELADA':
          statusColor = colorError;
          break;

        default:
          statusColor = colorPrimary;
          break;
      }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin:
          const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 20),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: ClipOval(
                child: Image.asset('assets/images/doctor_logo.png'
                  , width: 40, height: 40, fit: BoxFit.cover)), 

              title: Text(item.specialty.specialty),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    item.doctor.gender == 'M' ? Text('Dr. ${item.doctor.firstName} ${item.doctor.firstSurname}'): 
                        Text('Dra. ${item.doctor.firstName} ${item.doctor.firstSurname}'),
                    
                ],
              ),
              
              trailing: Text(item.status, style: TextStyle(color: statusColor)),
            ),
          ],
        )
      )
    );      
  }


}