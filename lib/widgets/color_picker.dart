import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({super.key});
  
  @override
  State<StatefulWidget> createState() {
   
    return _ColorPickerWidgetState();
  }
  // _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  Color _currentColor = Colors.red; // initial color

  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _currentColor,
              onColorChanged: (color) {
                setState(() {
                  _currentColor = color;
                });
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(_currentColor);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    ).then((color) {
      // do something with the selected color, e.g. save it to a variable
      if (color != null) {
        print('Selected color: $color');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _openColorPicker,
      child: Text('Pick a color'),
    );
  }
}
