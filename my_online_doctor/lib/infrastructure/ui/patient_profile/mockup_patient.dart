import 'package:my_online_doctor/domain/enumerations/genre_enum.dart';

class User {
  final String imagePath;
  final String firstName;
  final String middleName;
  final String firstSurname;
  final String secondSurname;
  final Genre gender;
  final DateTime birthdate;
  final String email;
  final int weight;
  final int height;
  final String background;
  final String allergies;
  final String surgeries;
  final String phoneNumber;

  const User(
      {required this.imagePath,
      required this.firstName,
      required this.middleName,
      required this.firstSurname,
      required this.secondSurname,
      required this.gender,
      required this.birthdate,
      required this.email,
      required this.weight,
      required this.height,
      required this.background,
      required this.allergies,
      required this.surgeries,
      required this.phoneNumber});
}

class ExampleUser {
  static final exampleUser = User(
    imagePath:
        'https://i1.rgstatic.net/ii/profile.image/563342394826752-1511322701683_Q512/Carlos-Alonzo-3.jpg',
    firstName: 'Carlos',
    middleName: '',
    firstSurname: 'Alonzo',
    secondSurname: '',
    gender: Genre.male,
    birthdate: DateTime.utc(1970, 1, 1),
    email: 'calonzo@gmail.com',
    weight: 70,
    height: 167,
    background:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    allergies: 'Polen, Gatos',
    surgeries: 'Amigdalas',
    phoneNumber: '04241234567',
  );
}
