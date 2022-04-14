import 'package:chopper/chopper.dart';
import 'model_converter.dart';
import 'model_response.dart';
import 'recipe_model.dart';

part 'recipe_service.chopper.dart';

const String apiKey = 'ebceb27137d7292a30d226be4a1d0f64';
const String apiId = '2ea74452';
const String apiUrl = 'https://api.edamam.com';

@ChopperApi()
abstract class RecipeService extends ChopperService {
  @Get(path: 'search')
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
    @Query('q') String query,
    @Query('from') int from,
    @Query('to') int to,
  );
static RecipeService create(){
  final client = ChopperClient(
    baseUrl: apiUrl,
    interceptors: [_addQuery, HttpLoggingInterceptor()],
    converter: ModelConverter(),
    errorConverter: const JsonConverter(),
    services: [
      _$RecipeService(),
    ],
  );
  return _$RecipeService(client);
}
}

Request _addQuery(Request req) {
  final params = Map<String, dynamic>.from(req.parameters);
  params['app_id'] = apiId;
  params['app_key'] = apiKey;
  return req.copyWith(parameters: params);
}
