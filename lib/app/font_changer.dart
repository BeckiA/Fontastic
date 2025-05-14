import 'package:flutter/material.dart';
import 'package:fontfamily_changer_flutter/model/font_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontChangerApp extends StatefulWidget {
  final String initialFont;

  const FontChangerApp({super.key, required this.initialFont});

  @override
  State<FontChangerApp> createState() => _FontChangerAppState();
}

class _FontChangerAppState extends State<FontChangerApp> {
  late String _selectedFont;
  final String _sampleText = 'The quick brown fox jumps over the lazy dog';

  final List<FontModel> _fonts = const [
    FontModel(name: 'Roboto', fontFamily: 'Roboto'),
    FontModel(name: 'Pacifico', fontFamily: 'Pacifico'),
    FontModel(name: 'OpenSans', fontFamily: 'OpenSans'),
  ];

  @override
  void initState() {
    super.initState();
    _selectedFont = widget.initialFont;
  }

  Future<void> _persistFontSelection(String font) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedFont', font);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font Changer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(bodyMedium: TextStyle(fontFamily: _selectedFont)),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Font Family Changer')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildFontDropdown(),
              const SizedBox(height: 20),
              _buildSampleText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFontDropdown() {
    return DropdownButton<String>(
      value: _selectedFont,
      items:
          _fonts.map((font) {
            return DropdownMenuItem<String>(
              value: font.name,
              child: Text(
                font.name,
                style: TextStyle(fontFamily: font.fontFamily),
              ),
            );
          }).toList(),
      onChanged: (String? newValue) async {
        if (newValue == null) return;
        await _persistFontSelection(newValue);
        setState(() => _selectedFont = newValue);
      },
    );
  }

  Widget _buildSampleText() {
    return Text(_sampleText, style: const TextStyle(fontSize: 24));
  }
}
