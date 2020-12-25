import 'package:flutter_dotenv/flutter_dotenv.dart';

final String env = DotEnv().env['ENVIROMENT'];

final String devHost = DotEnv().env['DEVELOPMENT_HOST'];
final String prodHost = DotEnv().env['PRODUCTION_HOST'];

final String devPort = DotEnv().env['DEVELOPMENT_PORT'];
final String prodPort = DotEnv().env['PRODUCTION_PORT'];

final String host = '${env == "prod" ? prodHost : devHost}';
final String port = '${env == "prod" ? prodPort : devPort}';

final String domain = '$host:$port';

// User Services
final String loginUrl = '$domain/users/login';
final String signinUrl = '$domain/users/signin';
final String getOneUserUrl = '$domain/users/:id';
final String updateOneUserUrl = '$domain/users/:id';
final String updateProfileImageUrl = '$domain/users/profile-image/:id';

// User Notification Services
final String getAllUserNotificationsUrl = '$domain/user-notifications';

// Ingredient Services
final String getAllIngredientsUrl = '$domain/ingredients';
final String getOneIngredientUrl = '$domain/ingredients/:id';
final String createOneIngredientUrl = '$domain/ingredients';

// Equipment Services
final String getAllEquipmentsUrl = '$domain/equipments';
final String getOneEquipmentUrl = '$domain/equipments/:id';
final String createOneEquipmentUrl = '$domain/equipments';

// Recipe Services
final String getAllRecipesUrl = '$domain/recipes';
final String getOneRecipeUrl = '$domain/recipes/:id';
final String createOneRecipeUrl = '$domain/recipes';

// Recipe Type Services
final String getAllRecipeTypesUrl = '$domain/recipe-types';

// Recipe Cuisine Services
final String getAllRecipeCuisinesUrl = '$domain/recipe-cuisines';

// Recipe Tags Services
final String getAllRecipeTagsUrl = '$domain/recipe-tags';

// Ingredient Category Services
final String getAllIngredientCategoriesUrl = '$domain/ingredient-categories';

// Nutrient Services
final String getAllNutrientsUrl = '$domain/nutrients';
