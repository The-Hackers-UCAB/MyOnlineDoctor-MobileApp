import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/colors.dart';
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
  String password = '';
  bool isPasswordVisible = false;

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
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            style: mainTheme().textTheme.headline6,
            maxLines: widget.maxLines,

            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: colorPrimary,
                  width: 1,
                )
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: colorPrimary,
                  width: 1,
                )
              ),
            ),
          ),
        ],
      );

  Widget buildPassword() => TextField(
        onChanged: ((value) => setState(() {
              password = value;
            })),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorPrimary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorPrimary,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: widget.text,
          labelText: widget.label,
          errorText: 'Las contraseñas no coinciden',
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? Icon(Icons.visibility_off_outlined)
                : Icon(Icons.visibility_outlined),
            onPressed: () => setState(
              () {
                isPasswordVisible = !isPasswordVisible;
              },
            ),
          ),
        ),
        obscureText: isPasswordVisible,
      );

  InputDecoration TextFieldDecoration() => InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorPrimary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorPrimary,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      );
}
