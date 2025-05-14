import 'package:flutter/material.dart';
import 'package:fontfamily_changer_flutter/app/font_changer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final savedFont = prefs.getString('selectedFont') ?? 'Roboto';
  runApp(FontChangerApp(initialFont: savedFont));
}
