// Package imports:
import 'dart:convert';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:my_online_doctor/application/use_cases/appointments/get_appointments_use_case.dart';
import 'package:my_online_doctor/application/use_cases/getters/get_genres_list_use_case.dart';
import 'package:my_online_doctor/application/use_cases/getters/get_phones_list_use_case.dart';
import 'package:my_online_doctor/application/use_cases/login_patient/login_patient.dart';
import 'package:my_online_doctor/application/use_cases/register_patient/register_patient_use_case.dart';
import 'package:my_online_doctor/infrastructure/core/constants/repository_constants.dart';
import 'package:my_online_doctor/infrastructure/core/context_manager.dart';
import 'package:my_online_doctor/infrastructure/core/navigator_manager.dart';
import 'package:my_online_doctor/infrastructure/core/repository_manager.dart';
import 'package:my_online_doctor/infrastructure/providers/local_storage/local_storage_provider.dart';
import 'package:my_online_doctor/infrastructure/ui/components/dialog_component.dart';
import 'package:my_online_doctor/infrastructure/ui/video_call/call.dart';
import 'package:my_online_doctor/infrastructure/core/firebase-handler/local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final getIt = GetIt.instance;

Future<void> backgroundHandler(RemoteMessage message) async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.show(
      DateTime.now().microsecond,
      message.notification!.title,
      message.notification!.body,
      const NotificationDetails(
          android: AndroidNotificationDetails(
              'com.example.my_online_doctor', 'channel_name',
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker',
              autoCancel: true)),
      payload: message.data['channelName']);
}


///InjectionManager: Class that manages the injection of dependencies.
class InjectionManager {
  static void setupInjections() async {
    getIt.registerSingleton<ContextManager>(ContextManager());
    getIt.registerSingleton<RepositoryManager>(RepositoryManager());

    NavigatorServiceContract.inject();

    //FIREBASE
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    //Getting the firebase token for the device.
    FirebaseMessaging.instance.getToken().then((token) {
      LocalStorageProvider.saveData(
          RepositoryPathConstant.firebaseToken.path, token!);
    });
    //USE CASES
    GetPhonesUseCaseContract.inject();
    GetGenreUseCaseContract.inject();
    RegisterPatientUseCaseContract.inject();
    LoginPatientUseCaseContract.inject();
    GetAppointmentsUseCaseContract.inject();
  }
}
