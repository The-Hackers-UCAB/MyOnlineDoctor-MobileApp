import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:my_online_doctor/domain/models/appointment/get_appointment_model.dart';
import 'package:my_online_doctor/domain/models/appointment/request_appointment_model.dart';
import 'package:my_online_doctor/domain/models/doctor/doctor_request_model.dart';
import 'package:my_online_doctor/domain/models/patient/sign_up_patient_domain_model.dart';

class AnaliticsService {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: analytics);

  //Log de cuando un usuario inicia sesion
  static Future logLogin(String userId) async {
    await analytics.logEvent(name: 'inicio_sesion', parameters: {
      'Email_usuario': userId,
    });
  }

  //Log de cuando un usuario cierra sesion
  static Future logLogout() async {
    await analytics.logEvent(name: 'cerrar_sesion');
  }

  //log de cuando un usuario se registra en el sistema
  static Future logRegisterPatient(SignUpPatientDomainModel patient) async {
    await analytics.logEvent(name: 'registrar_paciente', parameters: {
      'nombre': patient.dto.firstName,
      'segundo_nombre': patient.dto.middleName,
      'apellido': patient.dto.firstSurname,
      'segundo_apellido': patient.dto.secondSurname,
      'email': patient.createUserDto.email,
      'telefono': patient.dto.phoneNumber,
      'alergias': patient.dto.allergies,
      'Antecedentes': patient.dto.background,
      'Fecha_de_nacimiento': patient.dto.birthdate,
      'Altura': patient.dto.height,
      'Peso': patient.dto.weight,
      'Estado_del_paciente': patient.dto.status,
      'Genero': patient.dto.gender
    });
  }

  //log de cuando un paciente ve el detalle de una cita
  static Future logDetailedAppointment(GetAppointmentModel appointment) async {
    await analytics.logEvent(name: 'ver_detalle_cita', parameters: {
      'id_cita': appointment.id,
      'paciente':
          '${appointment.patient.firstName} ${appointment.patient.firstSurname}',
      'doctor':
          '${appointment.doctor.firstName} ${appointment.doctor.firstSurname}',
      // 'fecha_cita': appointment.date,
      'estado_cita': appointment.status,
      'motivo_cita': appointment.description,
      'tipo_cita': appointment.type,
      'Especialidad': appointment.specialty.specialty,
    });
  }

  //log de cuando un paciente visualiza sus citas medicas
  static Future logAppointments() async {
    await analytics.logEvent(name: 'ver_citas', parameters: {});
  }

  //log de cuando un paciente busca un doctor
  static Future logSearchDoctor(DoctorRequestModel doctor) async {
    String aux = '';
    for (var specialty in doctor.specialties) {
      aux += '${specialty.specialty} ';
    }
    await analytics.logEvent(name: 'buscar_doctor', parameters: {
      'doctor': '${doctor.firstName} ${doctor.firstSurname}',
      'especialidades': aux,
      'Genero': doctor.gender,
      'Estado': doctor.status,
      'Calificacion': doctor.rating
    });
  }

  static Future logRequestAppointment(
      RequestAppointmentModel appoinment) async {
    await analytics.logEvent(
      name: 'solicitar_cita',
      parameters: {
        'doctor': appoinment.doctorId,
        'especialidad': appoinment.doctorSpecialty,
        'motivo_cita': appoinment.description,
        'tipo_cita': appoinment.type,
      },
    );
  }

  static Future logAcceptAppointment() async {

    

  }


}
