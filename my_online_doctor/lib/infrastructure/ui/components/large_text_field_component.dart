import 'package:flutter/material.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/colors.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/theme.dart';

class LargeTextFieldComponent extends StatefulWidget{

  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;


  const LargeTextFieldComponent({Key? key, 
    required this.textEditingController,
    required this.hintText,
    required this.labelText,
    

  }) : super(key: key);


  @override
  // ignore: library_private_types_in_public_api
  _LargeTextFieldComponentState createState() =>
      _LargeTextFieldComponentState();
}


class _LargeTextFieldComponentState extends State<LargeTextFieldComponent> {

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.textEditingController,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: mainTheme().textTheme.labelMedium,
          focusedBorder:  const OutlineInputBorder(
            borderSide: BorderSide(
              color: colorPrimary,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: colorPrimary),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        minLines: 1,
        maxLines: 3,
        maxLength: 80,
        style: mainTheme().textTheme.bodyMedium,
        autofocus: true,
      );
  }

}