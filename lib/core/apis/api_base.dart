import '../utils/enum.dart';

String? baseUrl;
String? apiBase;

// Initialize API Bases for PRODUCTION or for STAGING
void initApi(Environment env) {
  switch (env) {
    case Environment.production:
      apiBase = 'https://api.unsplash.com';
      break;

    case Environment.staging:
      apiBase = 'https://api.unsplash.com';
      break;
  }
}
