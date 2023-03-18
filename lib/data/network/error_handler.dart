// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:tut_project/data/network/failure.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its error from response of API
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
  Failure _handleError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioErrorType.response:
        switch (dioError.response?.statusCode) {
          case ReponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure();
          case ReponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure();
          case ReponseCode.UNAUTHORIZED:
            return DataSource.UNAUTHORIZED.getFailure();
          case ReponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure();
          case ReponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR.getFailure();
          default:
            return DataSource.DEFAULT.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(
          ReponseCode.BAD_REQUEST,
          ReponseMessage.BAD_REQUEST,
        );
      case DataSource.FORBIDDEN:
        return Failure(
          ReponseCode.FORBIDDEN,
          ReponseMessage.FORBIDDEN,
        );
      case DataSource.UNAUTHORIZED:
        return Failure(
          ReponseCode.UNAUTHORIZED,
          ReponseMessage.UNAUTHORIZED,
        );
      case DataSource.NOT_FOUND:
        return Failure(
          ReponseCode.NOT_FOUND,
          ReponseMessage.NOT_FOUND,
        );
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(
          ReponseCode.INTERNAL_SERVER_ERROR,
          ReponseMessage.INTERNAL_SERVER_ERROR,
        );
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
          ReponseCode.CONNECT_TIMEOUT,
          ReponseMessage.CONNECT_TIMEOUT,
        );
      case DataSource.CANCEL:
        return Failure(
          ReponseCode.CANCEL,
          ReponseMessage.CANCEL,
        );
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
          ReponseCode.RECEIVE_TIMEOUT,
          ReponseMessage.RECEIVE_TIMEOUT,
        );
      case DataSource.SEND_TIMEOUT:
        return Failure(
          ReponseCode.SEND_TIMEOUT,
          ReponseMessage.SEND_TIMEOUT,
        );
      case DataSource.CACHE_ERROR:
        return Failure(
          ReponseCode.CACHE_ERROR,
          ReponseMessage.CACHE_ERROR,
        );
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
          ReponseCode.NO_INTERNET_CONNECTION,
          ReponseMessage.NO_INTERNET_CONNECTION,
        );
      default:
        return Failure(
          ReponseCode.UNKNOW_ERROR,
          ReponseMessage.UNKNOW_ERROR,
        );
    }
  }
}

class ReponseCode {
  // API status code error
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int FORBIDDEN = 403;
  static const int UNAUTHORIZED = 401;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;
  // local status code error
  static const int UNKNOW_ERROR = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
  static const int DEFAULT = -1;
}

class ReponseMessage {
  // API status code error
  static const String SUCCESS = "success";
  static const String NO_CONTENT = "succes with no content";
  static const String BAD_REQUEST = "Bad request, try again later";
  static const String FORBIDDEN = "forbidden request, try again later";
  static const String UNAUTHORIZED = "User is unauthorized, try again later";
  static const String NOT_FOUND = "URL is not found, try again later";
  static const String INTERNAL_SERVER_ERROR =
      "some thing went wrong, try again later";
  // local status code error
  static const String UNKNOW_ERROR = "some thing went wrong, try again later";
  static const String CONNECT_TIMEOUT = "time out error, try again later";
  static const String CANCEL = "request was cancelled, try again later";
  static const String RECEIVE_TIMEOUT = "time out errror, try again later";
  static const String SEND_TIMEOUT = "time out error, try again later";
  static const String CACHE_ERROR = "Cache error, try again later";
  static const String NO_INTERNET_CONNECTION =
      "Please check you internet connection";
  static const String DEFAULT = "some thing went wrong, try again later";
}

class ApiInternalStatus {
  static const int SUCCESS = 200;
  static const int FAILURE = 1;
}
