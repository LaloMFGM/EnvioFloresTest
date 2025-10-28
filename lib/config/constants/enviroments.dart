
import 'package:dio/dio.dart';

class Enviroments {

  static const githubUrl = 'https://api.github.com/users/';
  static final dio = Dio(BaseOptions(baseUrl: Enviroments.githubUrl));


}
