// ignore_for_file: must_be_immutable
//Fluter imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_doctor/application/bloc/edit_patient_profile/edit_patient_profile_bloc.dart';
import 'package:my_online_doctor/domain/enumerations/genre_enum.dart';
import 'package:my_online_doctor/domain/models/profile/get_patient_profile_model.dart';
import 'package:my_online_doctor/infrastructure/core/constants/text_constants.dart';

//Project imports
import 'package:my_online_doctor/infrastructure/ui/components/base_ui_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/button_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/button_header.dart';
import 'package:my_online_doctor/infrastructure/ui/components/loading_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/profile_picture_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/reusable_widgets.dart';
import 'package:my_online_doctor/infrastructure/ui/components/textfield_component.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/colors.dart';

class EditPatientProfilePage extends StatelessWidget {

  static const routeName = '/edit_patient_profile';

  GetPatientProfileModel patient;


  EditPatientProfilePage({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => EditPatientProfileBloc(),
      child: BlocBuilder<EditPatientProfileBloc, EditPatientProfileState>(
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
  Widget _body(BuildContext context, EditPatientProfileState state) {
    
    if(state is EditPatientProfileStateInitial) {

      context.read<EditPatientProfileBloc>().add(EditPatientProfileEventFetchBasicData(patient));
    }

    return Stack(
      children: [
        if(state is! EditPatientProfileStateInitial) _editPatientProfileStreamBuilder(context),
        if(state is EditPatientProfileStateInitial || state is EditPatientProfileStateLoading) const LoadingComponent(),
      ],
    );
  }


  //StreamBuilder for the EditPatientProfile Page
  Widget _editPatientProfileStreamBuilder(BuildContext builderContext) => StreamBuilder<GetPatientProfileModel>(
    stream: builderContext.read<EditPatientProfileBloc>().streamEditPatientProfile,
    builder: (BuildContext context, AsyncSnapshot<GetPatientProfileModel> snapshot) {

      if(snapshot.hasData && snapshot.data != null) {
        return _editPatientProfileRenderView(context, snapshot.data!);
      } 

      return const LoadingComponent();
    }
  );  



  Widget _editPatientProfileRenderView(BuildContext context, GetPatientProfileModel patient) => ListView(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    physics: const BouncingScrollPhysics(),
    children: [
      Column(
        children: [
          heightSeparator(context, 0.02),
          ProfilePictureComponent(
            gender: patient.gender == 'M' ? Genre.male : Genre.female,
            isEdit: true,
            onClicked: () async {},
          ),
          heightSeparator(context, 0.02),
          TextFieldWidget(
            label: 'Primer Nombre',
            text: patient.firstName,
            onChanged: (firstName) {},
          ),
          heightSeparator(context, 0.02),
          TextFieldWidget(
            label: 'Segundo Nombre',
            text: patient.middleName,
            onChanged: (middleName) {},
          ),
          heightSeparator(context, 0.02),
          TextFieldWidget(
            label: 'Primer Apellido',
            text: patient.firstSurname,
            onChanged: (firstSurname) {},
          ),
          heightSeparator(context, 0.02),
          TextFieldWidget(
            label: 'Segundo Apellido',
            text: patient.secondSurname,
            onChanged: (secondSurname) {},
          ),
          heightSeparator(context, 0.02),
          TextFieldWidget(
            label: 'Altura',
            text: patient.height.toString(),
            onChanged: (height) {},
          ),
          heightSeparator(context, 0.02),
          TextFieldWidget(
            label: 'Peso',
            text: patient.weight.toString(),
            onChanged: (weight) {},
          ),
          heightSeparator(context, 0.02),
          TextFieldWidget(
            label: 'Teléfono',
            text: patient.phoneNumber,
            onChanged: (phoneNumber) {},
          ),
          heightSeparator(context, 0.02),
          TextFieldWidget(
            label: 'Alergias',
            text: patient.allergies,
            maxLines: 5,
            onChanged: (allergies) {},
          ),
          heightSeparator(context, 0.02),
          TextFieldWidget(
            label: 'Antecedentes',
            text: patient.background,
            maxLines: 5,
            onChanged: (background) {},
          ),
          heightSeparator(context, 0.02),
          TextFieldWidget(
            label: 'Cirugías',
            text: patient.surgeries,
            maxLines: 5,
            onChanged: (surgeries) {},
          ),
          heightSeparator(context, 0.04),
          _renderSaveButton(context),
          heightSeparator(context, 0.02),
        ],
      ),
    ],
  );


  Widget _renderSaveButton(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 25),
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.065,
    child: ButtonComponent(
      title: TextConstant.saveChanges.text,
      // actionButton: () => context.read<AppointmentBloc>().add(
      //       AppointmentEventNavigateToWith('/bottom_menu', 2),
      //     ),
    ));



}
