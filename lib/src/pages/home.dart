import 'package:flutter/material.dart';
import 'package:p2/src/app.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Bienvenido"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/dollar.jpg')
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
                textStyle: new TextStyle(fontSize: 20)
              ),
              child: Text('Acceder'),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return MyApp();
                  }),
                )
              },
            ),
          )
        ],
      )
    );
  }
}