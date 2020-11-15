import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './presentation/app.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(App());
}
