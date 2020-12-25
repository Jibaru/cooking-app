import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'data/repositories/repositories.dart';
import './presentation/app.dart';

void main() async {
  final UserRepository userRepository = ApiUserRepository();
  await DotEnv().load('.env');
  await userRepository.loadPrefsUser();
  runApp(App());
}
