import 'package:flutter/material.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/colors.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/theme.dart';

class DoctorPage extends StatelessWidget {
  final double profilePicHeight = 280; //falta poner la referencia al doctor

  const DoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorWhite,
          elevation: 4.0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_rounded),
            color: colorBlack,
          )),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: _buildProfilePic(),
            ),
            Positioned(
              top: 250,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: _buildContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePic() => Container(
        child: Image.network(
          'https://i.blogs.es/8bca34/the-good-doctor/1024_2000.webp',
          width: double.infinity,
          height: profilePicHeight,
        ),
      );

  Widget _buildContent() => Column(
        children: [
          Text(
            'Good Doctor',
            style: mainTheme().textTheme.headline1,
          ),
          SizedBox(height: 3),
          Text(
            'Neurocirujano - Ginecologo',
            style: mainTheme().textTheme.headline3,
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_rounded, color: colorSecondary),
                  SizedBox(width: 5),
                  Text(
                    'Ccs, Venezuela',
                    style: mainTheme().textTheme.headline6,
                  ),
                ],
              ),
              Text(
                '* * * * *',
                style: mainTheme().textTheme.headline6,
              ),
            ],
          ),
          SizedBox(height: 6),
          Divider(),
          SizedBox(height: 10),
          Text(
            'About',
            style: mainTheme().textTheme.headline2,
          ),
          SizedBox(height: 5),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: mainTheme().textTheme.bodyText2,
          ),
          SizedBox(height: 15),
          TextButton.icon(
              onPressed: () {},
              style: _buttonStyle(),
              icon: Icon(Icons.date_range_rounded),
              label: Text('Pedir Cita'))
        ],
      );

  ButtonStyle _buttonStyle() => TextButton.styleFrom(
        backgroundColor: colorPrimary,
        primary: colorWhite,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      );
}


// Wrap(
//               children: List.generate(5, (index) {
//                 return Icon(Icons.star_rounded);
//               }),
//             ),