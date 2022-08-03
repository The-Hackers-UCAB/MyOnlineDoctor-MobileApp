//Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Project imports:
import 'package:my_online_doctor/application/bloc/patient_profile/patient_profile_bloc.dart';
import 'package:my_online_doctor/domain/enumerations/genre_enum.dart';
import 'package:my_online_doctor/domain/models/profile/get_patient_profile_model.dart';
import 'package:my_online_doctor/domain/services/calculate_patient_age_domain_service.dart';
import 'package:my_online_doctor/infrastructure/core/constants/text_constants.dart';
import 'package:my_online_doctor/infrastructure/ui/components/base_ui_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/button_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/loading_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/profile_picture_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/reusable_widgets.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/colors.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/theme.dart';
import 'package:my_online_doctor/infrastructure/utils/app_util.dart';


class PatientProfilePage extends StatelessWidget{

  static const routeName = '/patient_profile';

  const PatientProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => PatientProfileBloc(),
      child: BlocBuilder<PatientProfileBloc, PatientProfileState>(
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
  PreferredSizeWidget _renderAppBar(BuildContext context) =>
      AppBar(backgroundColor: colorPrimary, title: Text(TextConstant.profileTitle.text), centerTitle: true,);

  //Widget Body
  Widget _body(BuildContext context, PatientProfileState state) {
    
    if (state is PatientProfileStateInitial) {
      context.read<PatientProfileBloc>().add(PatientProfileEventFetchBasicData());
    }

    return Stack(
      children: [
        if (state is! PatientProfileStateInitial) _patientProfileStreamBuilder(context),
        if (state is PatientProfileStateInitial || state is PatientProfileStateLoading)
          const LoadingComponent(),
      ],
    );

  }




  //StreamBuilder for the PatientProfile Page
  Widget _patientProfileStreamBuilder(BuildContext builderContext) => StreamBuilder<GetPatientProfileModel?>(
    stream: builderContext.read<PatientProfileBloc>().streamPatientProfile,
    builder: (BuildContext context, AsyncSnapshot<GetPatientProfileModel?> snapshot) {

      if(snapshot.hasData && snapshot.data != null) {
        return _patientProfileRenderView(context, snapshot.data!);
      } 

      return const LoadingComponent();
    }
  );  



  Widget _patientProfileRenderView(BuildContext context, GetPatientProfileModel patient) {

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          children: [
            heightSeparator(context, 0.02),
            _renderPatientProfilePicture(context, patient),
            heightSeparator(context, 0.02),
            _renderPatientName(context, patient),
            heightSeparator(context, 0.02),
            _renderPatientProfileBody(context, patient),
            heightSeparator(context, 0.1),
            _renderViewMedicalRecordButton(context),
          ],
        ),
      ],
    );

  }


  ///Widget Patient Profile Picture
  Widget _renderPatientProfilePicture(BuildContext context, GetPatientProfileModel patient) => ProfilePictureComponent(
    gender: patient.gender == 'M' ? Genre.male : Genre.female,
    onClicked: () async {
      await AppUtil.showDialogUtil(
        context: context, 
        title: TextConstant.toBeContinued.text, 
        message: TextConstant.pageInConstruction.text);
      // context.read<PatientProfileBloc>().add(PatientProfileEventNavigateTo('/edit_patient_profile', arguments: patient));
    },
  );



  Widget _renderPatientName(BuildContext context, GetPatientProfileModel patient) => Column(
        children: [
          Text(
            '${patient.firstName} ${patient.firstSurname}',
            style: mainTheme().textTheme.headline1,
          ),
          heightSeparator(context, 0.01),
          Text(
            'Status: ${patient.status}',
            style: mainTheme().textTheme.headline4,
          )
        ],
      );
  


  Widget _renderPatientProfileBody(BuildContext context, GetPatientProfileModel patient) => Stack(
    children: [
      Positioned(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 209, 209, 209),
                blurRadius: 20,
                offset: Offset(0, -1),
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
              _buildPatientData(context, patient),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: const Divider(),
              ),
              const SizedBox(height: 5),
              _buildPatientBackground(context, patient),
              heightSeparator(context, 0.02),
            ],
          ),
        ),
      ),
    ],
  );


  Widget _buildPatientData(BuildContext context, GetPatientProfileModel patient) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButton(context, '${CalculatePatientAgeDomainService.calculatePatientAge(DateTime.parse(patient.birthdate))}', 'Edad'),
      _buildDivider(context),
      _buildButton(
          context,
          patient.gender == 'M' ? 'Masculino' : 'Femenino',
          'Género'),
      _buildDivider(context),
      _buildButton(context, '${patient.height}cm', 'Altura'),
      _buildDivider(context),
      _buildButton(context, '${patient.weight}kg', 'Peso'),
    ],
  );



  Widget _buildDivider(BuildContext context) => const SizedBox(
    height: 24,
    child: VerticalDivider(),
  );


  Widget _buildButton(BuildContext context, String data, String dataTag) => Column(
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



  Widget _buildPatientBackground(BuildContext context, GetPatientProfileModel patient) => Column(
        children: [
          // _buildPatientInfo(context, patient.allergies, 'Alergias'),
          heightSeparator(context, 0.02),
          _buildPatientInfo(context, patient.background, 'Antecedentes'),
          heightSeparator(context, 0.02),
          // _buildPatientInfo(context, patient.surgeries, 'Cirugias'),
          // const SizedBox(height: 20),
        ],
      );  


  Widget _buildPatientInfo(BuildContext context, String info, String tittle) => Container(
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



  Widget _renderViewMedicalRecordButton(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 25),
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.065,
    child: ButtonComponent(
      title: TextConstant.viewMedicalRecord.text,
      actionButton: () => context.read<PatientProfileBloc>().add(PatientProfileEventNavigateTo('/view_medical_records')),
    ));

}