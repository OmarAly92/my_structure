import 'package:dio/dio.dart';
import 'package:my_structure/core/api/api_request_helpers/api_consumer.dart';
import 'package:my_structure/core/api/api_request_helpers/end_points.dart';

class RefreshTokenInterceptor extends InterceptorsWrapper {
  final ApiConsumer apiConsumer;

  RefreshTokenInterceptor(this.apiConsumer);

  bool _isRefreshing = false;

  final _requestsNeedRetry =
      <({RequestOptions options, ErrorInterceptorHandler handler})>[];

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response;
    if (response != null &&
        response.statusCode == 401 &&
        response.requestOptions.path != EndPoints.refreshToken) {
      if (!_isRefreshing) {
        _isRefreshing = true;

        _requestsNeedRetry.add((
          options: response.requestOptions,
          handler: handler,
        ));

        final isRefreshSuccess = await _refreshToken();

        _isRefreshing = false;

        if (isRefreshSuccess) {
          for (var requestNeedRetry in _requestsNeedRetry) {
            final retry = await apiConsumer.client.fetch(
              requestNeedRetry.options,
            );
            requestNeedRetry.handler.resolve(retry);
          }
          _requestsNeedRetry.clear();
        } else {
          _requestsNeedRetry.clear();
        }
      } else {
        _requestsNeedRetry.add((
          options: response.requestOptions,
          handler: handler,
        ));
      }
    } else {
      return handler.next(err);
    }
  }

  Future<bool> _refreshToken() async {
    try {
      // final response = await apiConsumer.post(EndPoints.refreshToken);
      // final loginResponseModel = LoginResponseModel.fromJson(response.data);
      // await PrefHelper.save(
      //   PrefKeys.token,
      //   loginResponseModel.loginDataResponse?.token,
      // );

      apiConsumer.setDioOptions();

      return true;
    } catch (error) {
      return false;
    }
  }
}
