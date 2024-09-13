import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/common/widgets/app.dart';

late SharedPreferences shp;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shp = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
