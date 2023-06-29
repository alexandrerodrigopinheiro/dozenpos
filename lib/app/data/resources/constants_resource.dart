
import '../models/login_model.dart';

class ConstantsResource {
  static const String baseUrl = 'https://rapidinha.api.coinspiration.com.br/api';
  static const String appKey = 'e25388fde8290dc286a6164fa2d97e551b53498dcbf7bc378eb1f178';
  static const String accessToken = '';
  static const String appVersion = '1.0.0';
  static const String appName = 'Rapidinha PDV';
  static const String userAgent = 'rapidinha_pdv';
  static const String contentType = 'application/json; charset=utf-8';
  static const int maxAuthRetries = 10;
  static const Duration connectTimeout = Duration(milliseconds:5000000);
  static const Duration receiveTimeout = Duration(milliseconds:5000000);
  static const bool systemMode = false;
  static LoginModel? user;
}
