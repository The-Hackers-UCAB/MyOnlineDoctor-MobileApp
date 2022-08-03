import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/enumerations/genre_enum.dart';
import '../styles/colors.dart';

class ProfilePictureComponent extends StatelessWidget {
  final Genre gender;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfilePictureComponent({
    Key? key,
    required this.gender,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Stack(
          children: [
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: Ink.image(
                  image: AssetImage(
                    gender == Genre.male
                        ? 'assets/images/paciente_hombre.jpg'
                        : 'assets/images/paciente_mujer.png',
                  ),
                  width: 128,
                  height: 128,
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: onClicked,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: _buildEditIcon(colorPrimary),
            )
          ],
        ),
      );

  Widget _buildEditIcon(Color color) => _buildCircle(
        color: colorWhite,
        all: 2,
        child: _buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit ? Icons.add_a_photo_outlined : Icons.edit,
            size: 15,
            color: colorWhite,
          ),
        ),
      );

  Widget _buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
