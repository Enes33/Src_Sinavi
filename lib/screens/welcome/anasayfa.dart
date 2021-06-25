import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/hakkinda.dart';
import 'package:quiz_app/istatistik/istatistik.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/sorulabilecek/screens/sorulabileceklist.dart';

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

            backgroundColor: Colors.grey,

            appBar: AppBar(title: Text("Anasayfa"),
              backgroundColor: Colors.blueAccent,),
            body: Center(

              child:Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children:<Widget>[

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:Colors.blueAccent,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      ),
                      child: Text('Src Deneme Soruları'),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:Colors.blueAccent,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Hakkinda()),
                      ),
                      child: Text('Hakkında'),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:Colors.blueAccent,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BarChartSample2()),
                      ),
                      child: Text('istatistik'),
                    ),
                  ),






                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:Colors.blueAccent,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sorulabileceklist()),
                      ),
                      child: Text('Sorulabilecek Sorular'),
                    ),
                  ),
                ],
              ),
            )));
  }
}