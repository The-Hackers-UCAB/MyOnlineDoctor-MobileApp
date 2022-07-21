import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_online_doctor/application/bloc/rate_appointment/rate_appointment_bloc.dart';
import 'package:my_online_doctor/domain/models/appointment/rate_appointment_model.dart';
import 'package:my_online_doctor/infrastructure/ui/components/base_ui_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/button_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/loading_component.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/colors.dart';

class RatingPage extends StatefulWidget {

  static const routeName = '/rating';

  final String appointmentId;

  RatingPage({Key? key, required this.appointmentId}) : super(key: key);

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int rating = 0;


  @override
  Widget build(BuildContext context){
    return BlocProvider(
      lazy:  false,
      create: (context) => RateAppointmentBloc(),
      child: BlocBuilder<RateAppointmentBloc, RateAppointmentState>(
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



  ///Widget AppBar
  PreferredSizeWidget _renderAppBar(BuildContext context) => AppBar( backgroundColor: colorPrimary);

  
  //Widget Bottom Navigation Bar
  Widget _renderBottomNavigationBar(BuildContext context) => 
    Container(width: double.infinity, height: MediaQuery.of(context).size.height * 0.05, color: colorSecondary);



    //Widget Body
  Widget _body(BuildContext context, RateAppointmentState state) {
    
    if(state is RateAppointmentStateInitial) {
      context.read<RateAppointmentBloc>().add(RateAppointmentEventFetchBasicData());
    }

    return Stack(
      children: [
        if(state is! RateAppointmentStateInitial)  _rateAppointmentStreamBuilder(context),
        if(state is RateAppointmentStateInitial || state is RateAppointmentStateLoading) const LoadingComponent(),
      ],
    );
  }


  //StreamBuilder for the RateAppointment Page
  Widget _rateAppointmentStreamBuilder(BuildContext builderContext) => StreamBuilder<bool>(
    stream: builderContext.read<RateAppointmentBloc>().streamRateAppointment,
    builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {

      if(snapshot.hasData) {
        return _rateAppointmentRenderView(context);
      } 

      return const LoadingComponent();
    }
  );



  Widget _rateAppointmentRenderView(BuildContext context){
    return  Scaffold(


        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/images/doctor_logo.png'
                  , width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.2, 
                ),
              ),
              Text(
                'Rating: $rating'.substring(0,9) ,
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                minRating: 1,
                itemBuilder: (context,_) => const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) =>
                  setState(() {
                    this.rating = rating.toInt();
                  }),
              ),
              const SizedBox(height: 30),
              _renderRegisterButton(context)
            ],
          ),
        ),
    );
  }



   Widget _renderRegisterButton(BuildContext context) => Padding(
     padding: const EdgeInsets.all(20.0),
     child: SizedBox(
      width: double.infinity,
      child: ButtonComponent(
        title: 'Calificar',
        style: ButtonComponentStyle.primary,
        actionButton: () => context.read<RateAppointmentBloc>().add(RateAppointmentEventRated(RateAppointmentModel(
          rating: rating,
          id: widget.appointmentId,), context)),

      )
  ),
   );
   

}
