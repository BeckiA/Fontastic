import 'package:flutter/material.dart';

void main() {
  runApp(FontChangerApp());
}

class FontChangerApp extends StatefulWidget {
  const FontChangerApp({super.key});

  @override
  _FontChangerAppState createState() => _FontChangerAppState();
}

class _FontChangerAppState extends State<FontChangerApp> {
  String _selectedFont = 'Roboto';
  final String _sampleText = 'The quick brown fox jumps over the lazy dog';

  final List<Map<String, String>> _fonts = [
    {'name': 'Roboto', 'fontFamily': 'Roboto'},
    {'name': 'Pacifico', 'fontFamily': 'Pacifico'},
    {'name': 'OpenSans', 'fontFamily': 'OpenSans'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font Changer',
      home: Scaffold(
        appBar: AppBar(title: Text('Font Family Changer')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Font selection dropdown
              DropdownButton<String>(
                value: _selectedFont,

                items:
                    _fonts.map((font) {
                      return DropdownMenuItem<String>(
                        value: font['name'],
                        child: Text(
                          font['name']!,
                          style: TextStyle(fontFamily: font["fontFamily"]!),
                        ),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedFont = newValue!;
                  });
                },
              ),

              SizedBox(height: 20),

              // Sample text with selected font
              Text(
                _sampleText,
                style: TextStyle(fontFamily: _selectedFont, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
