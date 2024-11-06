sealed class StatusCode {
  /// remote status code
  // Success
  static const int ok = 200;
  static const int noContent = 201;

  // Failure
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int conflict = 409;
  static const int internalServerError = 500;

  /// local status code
  static const int connectionTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int kDefault = -7;
}

// class ResponseMessage {
//   static const String SUCCESS = AppStrings.success; // success with data
//   static const String NO_CONTENT = AppStrings.success; // success with no data (no content)
//   static const String BAD_REQUEST = AppStrings.strBadRequestError; // failure, API rejected request
//   static const String UNAUTHORISED = AppStrings.strUnauthorizedError; // failure, user is not authorised
//   static const String FORBIDDEN = AppStrings.strForbiddenError; //  failure, API rejected request
//   static const String INTERNAL_SERVER_ERROR = AppStrings.strInternalServerError; // failure, crash in server side
//   static const String NOT_FOUND = AppStrings.strNotFoundError; // failure, crash in server side
//
//   // local status code
//   static const String CONNECT_TIMEOUT = AppStrings.strTimeoutError;
//   static const String CANCEL = AppStrings.strDefaultError;
//   static const String RECEIVE_TIMEOUT = AppStrings.strTimeoutError;
//   static const String SEND_TIMEOUT = AppStrings.strTimeoutError;
//   static const String CACHE_ERROR = AppStrings.strCacheError;
//   static const String NO_INTERNET_CONNECTION = AppStrings.strNoInternetError;
//   static const String DEFAULT = AppStrings.strDefaultError;
// }
