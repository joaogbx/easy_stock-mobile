import 'package:flutter_dotenv/flutter_dotenv.dart';

String get apiUrl => dotenv.env['API_URL'] ?? 'http://localhost:3000';
int get apiTimeout => int.tryParse(dotenv.env['API_TIMEOUT'] ?? '10') ?? 10;
bool get isDebugMode => dotenv.env['DEBUG_MODE']?.toLowerCase() == 'true';
String get environment => dotenv.env['ENVIRONMENT'] ?? 'development';
