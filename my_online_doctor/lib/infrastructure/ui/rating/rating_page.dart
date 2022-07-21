import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_online_doctor/infrastructure/ui/components/button_component.dart';

class RatingPage extends StatefulWidget {

  static const routeName = '/rating';
  const RatingPage({Key? key}) : super(key: key);

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Calificar al Doctor')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/images/doctor_logo.png'
                  , width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.2, 
                ),
              ),
              Text(
                'Rating: $rating'.substring(0,9) ,
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                minRating: 1,
                itemBuilder: (context,_) => Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) =>
                  setState(() {
                    this.rating = rating;
                  }),
              ),
              const SizedBox(height: 30),
              _renderRegisterButton(context)
            ],
          ),
        ),
    );
  }

   Widget _renderRegisterButton(BuildContext context) => Padding(
     padding: const EdgeInsets.all(20.0),
     child: SizedBox(
      width: double.infinity,
      child: ButtonComponent(
        title: 'Registrar',
        style: ButtonComponentStyle.primary,
        actionButton: () => Navigator.pushReplacementNamed(context, '/bottom_menu'),
      )
  ),
   );

}
