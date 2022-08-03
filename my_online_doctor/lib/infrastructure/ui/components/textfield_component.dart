import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/theme.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String text;
  final int maxLines;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.text,
    this.maxLines = 1,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: mainTheme().textTheme.headline6,
          ),
          SizedBox(height: 8),
          TextField(
            controller: controller,
            style: mainTheme().textTheme.headline6,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      );
}
