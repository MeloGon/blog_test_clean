import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtil {
  //final logger = Logger(printer: LoggerUtil());
  final Dio _dio = Dio();

  Future<dynamic> post(
      {String url = '',
      Map? formData,
      String? token,
      //Encoding? encoding,
      //int? receiveTimeOut,
      bool showPrint = true}) async {
    if (!await _checkInternetConnection())
      throw new Exception(['NOT_INTERNET_EXCEPTION']);

    if (token != null)
      _dio.options.headers.addAll({"Authorization": "$token"});
    else
      _dio.options.headers.remove("Authorization");

    _dio.options.contentType = Headers.jsonContentType;

    // logger.d("URL POST: " + AppHelpers.networkUrl + url);
    // logger.d("Headers: " + _dio.options.headers.toString());
    if (showPrint) {
      //logger.d("Body: " + formData.toString());
    }

    return _dio
        .post(url,
            data: formData,
            options: Options(
                method: 'POST',
                //sendTimeout: receiveTimeOut,
                responseType: ResponseType.json // or ResponseType.JSON
                ))
        .then((Response response) {
      //logger.d("Response [" + response.statusCode.toString() + "]: $response");

      return response.data;
    }).catchError((error) => print("EL ERROR $error"));
  }

  Future<dynamic> get({
    String url = '',
    Map<String, String>? parameters,
    String? token,
    /*Encoding? encoding*/
  }) async {
    if (!await _checkInternetConnection())
      throw new Exception(['NOT_INTERNET_EXCEPTION']);

    if (token != null)
      _dio.options.headers.addAll({"Authorization": "Token $token"});
    else
      _dio.options.headers.remove("Authorization");

    _dio.options.contentType = Headers.jsonContentType;

    // logger.d("URL GET: " + AppHelpers.networkUrl + url);
    // logger.d("Headers: " + _dio.options.headers.toString());

    return _dio
        .get(url,
            queryParameters: parameters ?? {},
            options: Options(
                method: 'GET',
                responseType: ResponseType.json // or ResponseType.JSON
                ))
        .then((Response response) {
      //logger.d("Response [" + response.statusCode.toString() + "]: $response");

      return response.data;
    }).catchError((error) => print("EL ERROR $error"));
  }

  Future<bool> _checkInternetConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }
    return true;
  }
}
