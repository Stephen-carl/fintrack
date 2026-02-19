import 'package:flutter/material.dart';

// i'm using this to describe how the number will be displayed
// and it will be a nested list
class Numpad extends StatelessWidget {
  final void Function(String key) onKeyTap;

  const Numpad({super.key, required this.onKeyTap});

  static const _layout = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['.', '0', '<'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _layout.map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row
              .map((key) => _NumKey(label: key, onTap: onKeyTap))
              .toList(),
        );
      }).toList(),
    );
  }
}

class _NumKey extends StatelessWidget {
  final String label;
  final void Function(String) onTap;

  const _NumKey({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Invisible dot key bcus of the design
    if (label == '.') {
      return SizedBox(width: 72, height: 30);
    }

    return GestureDetector(
      onTap: () => onTap(label),
      child: SizedBox(
        width: 72,
        height: 30,
        child: Center(
          child: label == '<'
              ? Icon(Icons.backspace_outlined, size: 22, color: Colors.black87)
              : Text(
                  label,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
        ),
      ),
    );
  }
}
