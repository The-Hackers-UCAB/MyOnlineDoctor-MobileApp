// Dart imports:
import 'dart:async';
import 'dart:io';

// Package imports:
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:my_online_doctor/infrastructure/core/constants/repository_constants.dart';
import 'package:my_online_doctor/infrastructure/core/constants/text_constants.dart';
import 'package:my_online_doctor/infrastructure/utils/app_util.dart';

// Project imports:
import 'context_manager.dart';
import 'flavor_manager.dart';
import 'injection_manager.dart';
import 'package:my_online_doctor/infrastructure/model/request_responde_model.dart';


///RepositoryManager: This class is used to manage the repository main connection.
class RepositoryManager {
  Future<BaseOptions> _dioBaseOptions(String endpoint) async {
    var repositoryHeader = <String, dynamic>{};
    var url=FlavorManager.baseURL();
    var options = BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(minutes: 1).inMilliseconds,
        receiveTimeout: const Duration(minutes: 1).inMilliseconds,
        responseType: ResponseType.plain,
        headers: repositoryHeader,
        contentType: RepositoryConstant.contentType.key);
    return options;
  }

  void _validateCertificate(Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<String?> request({required String operation, required String endpoint, Map<String,dynamic>? body, bool wompi=false}) async {
    
    endpoint = FlavorManager.baseURL() + endpoint;
    
    var setDioOptions = await _dioBaseOptions(endpoint);

    var dio = Dio(setDioOptions);

    _validateCertificate(dio);

    Response? response;

    try {
      if (operation == RepositoryConstant.operationGet.key) {
        response = await dio.get(endpoint);
      } else if (operation == RepositoryConstant.operationPost.key) {
        response = await dio.post(endpoint, data: body);
      } else if (operation == RepositoryConstant.operationPut.key) {
        if (body != null) {
          response = await dio.put(endpoint, data: body);
        } else {
          response = await dio.put(endpoint);
        }
      } else if (operation == RepositoryConstant.operationDelete.key) {
        if (body != null) {
          response = await dio.delete(endpoint, data: body);
        } else {
          response = await dio.delete(endpoint);
        }
      }

      dio.close();


      return response?.data /*utf8.decode(response.data)*/;
    } on DioError catch (e) {
      _errorRequest(e);
    }
    return null;
  }

  void _errorRequest(DioError e) {
    if (DioErrorType.receiveTimeout == e.type || DioErrorType.connectTimeout == e.type) {
      AppUtil.showDialogUtil(context: getIt<ContextManager>().context, message:TextConstant.errorTimeoutConnection.text);
      throw 600;
    } else if (e.message.contains('SocketException')) {
      AppUtil.showDialogUtil(context: getIt<ContextManager>().context, message:TextConstant.errorInternetConnection.text);
      throw 600;
    } else {
      switch (e.response!.statusCode!) {
        case 401:
          AppUtil.showDialogUtil(context: getIt<ContextManager>().context, message:TextConstant.errorUnauthorized.text);
          throw 401;
        case 404:
          AppUtil.showDialogUtil(context: getIt<ContextManager>().context, message:TextConstant.errorServer.text);
          throw 404;
        case 500:
          AppUtil.showDialogUtil(context: getIt<ContextManager>().context, message: TextConstant.errorServer.text);
          throw 500;
        default:
          var error = requestResponseModelFromJson(e.response!.data);
          AppUtil.showDialogUtil(context: getIt<ContextManager>().context, message: error.message ?? TextConstant.errorServer.text);
          throw e.response!.statusCode!;
      }
    }
  }


}
