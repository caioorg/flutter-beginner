 import 'package:first_project/screens/listview.dart';
import 'package:flutter/material.dart';

class DogPage extends StatelessWidget {
  final Dog dog;

  DogPage(this.dog);

  @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text(dog.nome)
       ),
       body: Image.asset(dog.foto),
     );
   }
 }
