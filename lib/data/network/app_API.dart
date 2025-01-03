import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_now/data/response/responses.dart';

import '../../app/constants.dart';
part 'app_API.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
