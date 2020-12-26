import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Caio Almeida'),
                accountEmail: Text('caioalmeidasilva96@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png'),
                ),
              ),
              ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Favoritos'),
                  subtitle: Text('Mais informações ...'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    print('aqui');
                    Navigator.pop(context);
                  })
            ],
          ),
      )
    );
  }
}
