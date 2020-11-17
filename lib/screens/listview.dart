import 'package:first_project/screens/dog_page.dart';
import 'package:first_project/utils/navigator.dart';
import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        actions: [
          IconButton(
              icon: Icon(Icons.list), onPressed: () => setState(() => _gridView = false)),
          IconButton(
              icon: Icon(Icons.grid_on), onPressed: () => setState(() => _gridView = true))
        ],
      ),
      body: _body(),
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog('Jack Russel', 'assets/images/dog1.png'),
      Dog('Labrador', 'assets/images/dog2.png'),
      Dog('Pug', 'assets/images/dog3.png'),
      Dog('Rottweiler', 'assets/images/dog4.png'),
      Dog('Pastor', 'assets/images/dog5.png'),
    ];


    if (_gridView) {
      return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: dogs?.length,
          itemBuilder: (context, index) => _card(dogs, index));
    } else {
      return ListView.builder(
          itemCount: dogs?.length,
          itemExtent: 300,
          itemBuilder: (context, index) => _card(dogs, index));
    }
  }

  _card(List<Dog> dogs, int index) {
    Dog dog = dogs[index];
    return GestureDetector(
      onTap: () => push(context, DogPage(dog)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _img(dog.foto),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black45, borderRadius: BorderRadius.circular(8)),
              child: Text(dog.nome,
                  style: TextStyle(fontSize: 26, color: Colors.white)),
            ),
          )
        ],
      )
    );
  }
}
