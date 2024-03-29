///RepositorysConstant: Enum for repositories methods.
enum RepositoryConstant {
  contentType,
  operationGet,
  operationPost,
  operationPut,
  operationDelete,
}

extension RepositoryConstantExtension on RepositoryConstant {
  String get key {
    switch (this) {
      case RepositoryConstant.contentType:
        return 'application/json';
      case RepositoryConstant.operationGet:
        return 'get';
      case RepositoryConstant.operationPost:
        return 'post';
      case RepositoryConstant.operationPut:
        return 'put';
      case RepositoryConstant.operationDelete:
        return 'delete';
    }
  }
}

///RepositoryPathConstant: Enum for endpoints path.
enum RepositoryPathConstant {
  register,
  login,
  logout,
  getAppointments,
  cookie,
  firebaseToken,
  cancelAppointment,
  rejectAppointment,
  acceptAppointment,
  getDoctors,
  requestAppointment,
  rateAppointment,
  initiatedAppointment,
  recoverPatientPassword,
  getPatientProfile,
  updatePatientProfile,
  getPatientMedicalRecord,
}

extension RepositoryPathConstantExtension on RepositoryPathConstant {
  String get path {
    switch (this) {
      case RepositoryPathConstant.register:
        return 'api/patient';

      case RepositoryPathConstant.login:
        return 'api/auth/login';

      case RepositoryPathConstant.logout:
        return 'api/auth/logout';

      case RepositoryPathConstant.getAppointments:
        return 'api/patient/appointments?pageIndex=0&pageSize=5';

      case RepositoryPathConstant.cookie:
        return 'cookie';

      case RepositoryPathConstant.firebaseToken:
        return 'firebaseToken';

      case RepositoryPathConstant.cancelAppointment:
        return 'api/appointment/cancel/patient';

      case RepositoryPathConstant.rejectAppointment:
        return 'api/appointment/reject/patient';

      case RepositoryPathConstant.acceptAppointment:
        return 'api/appointment/accept/patient';

      case RepositoryPathConstant.getDoctors:
        return 'api/doctor/search?pageIndex=0&pageSize=20';

      case RepositoryPathConstant.requestAppointment:
        return 'api/appointment/request';

      case RepositoryPathConstant.rateAppointment:
        return 'api/appointment/rate/patient';

      case RepositoryPathConstant.initiatedAppointment:
        return 'api/appointment/initiate/patient';

      case RepositoryPathConstant.recoverPatientPassword:
        return ''; //TDOO: add endpoint

      case RepositoryPathConstant.getPatientProfile:
        return 'api/patient/profile'; //TDOO: add endpoint

      case RepositoryPathConstant.updatePatientProfile:
        return ''; //TDOO: add endpoint

      case RepositoryPathConstant.getPatientMedicalRecord:
        return 'api/patient/medical-records?pageIndex=0&pageSize=5'; //TDOO: add endpoint

    }
  }
}
