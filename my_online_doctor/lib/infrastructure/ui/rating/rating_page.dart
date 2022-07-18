import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Calificacion del doctor')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rating: $rating'.substring(0,9) ,
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 10),
              RatingBar.builder(
                minRating: 1,
                itemBuilder: (context,_) => Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) =>
                  setState(() {
                    this.rating = rating;
                  }),
              ),
              SizedBox(height: 30),
              TextButton(
                  onPressed: () {},
                  child: Text('Calificar')
              )
            ],
          ),
        ),
      ),
    );
  }
}
