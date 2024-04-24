import 'package:flutter/material.dart';

class CustomDropButton extends StatefulWidget {
  CustomDropButton({
    super.key,
    required this.title,
    required this.items,
    required this.value,
  });

  List<String> items;
  String title;
  String value;

  @override
  State<CustomDropButton> createState() => _CustomDropButtonState();
}

class _CustomDropButtonState extends State<CustomDropButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        const Expanded(child: SizedBox(width: 16)),
        // const SizedBox(width: 16),
        DropdownButton<String>(
          dropdownColor: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
          value: widget.value,
          onChanged: (String? newValue) {
            setState(() {
              widget.value = newValue!;
            });
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(value),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
