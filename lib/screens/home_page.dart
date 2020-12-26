import 'package:first_project/screens/hello_page2.dart';
import 'package:first_project/screens/hello_page3.dart';
import 'package:first_project/screens/listview.dart';
import 'package:first_project/utils/navigator.dart';
import 'package:first_project/widgets/button/main.dart';
import 'package:first_project/widgets/drawer/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hello Flutter',
          ),
          bottom: TabBar(tabs: [
            Tab(text: 'Tab1'),
            Tab(text: 'Tab2'),
            Tab(text: 'Tab3')
          ],),
        ),
        body: TabBarView(children: [
          _body(context),
          _body(context),
          _body(context)
        ]),
        floatingActionButton:  FloatingActionButton(onPressed: () => _onClickFab(), child: Icon(Icons.add)),
        drawer: DrawerList()
    )
    );
  }

  _onClickFab() => print('Floating Button');

  void _onClickNavigator(BuildContext context, Widget page) async =>
      await push(context, page);

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Olá Flutter'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () => print('OK SNACKBAR'),
        textColor: Colors.yellow,
      ),
    ));
  }

  _onClickDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            //Não deixa fechar o Dialog no Android
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text('Flutter é top'),
              actions: [
                FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar')),
                FlatButton(
                    onPressed: () =>
                        {Navigator.pop(context), print('Fecho pelo OK')},
                    child: Text('OK'))
              ],
            ),
          );
        });
  }

  _onClickToast(text, { color: Colors.blue}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 5,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  _body(context) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_text(), _pageView(), _buttons()],
      ),
    ));
  }

  _pageView() {
    return Container(
      height: 300,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: PageView(
        children: [
          _img('assets/images/dog1.png'),
          _img('assets/images/dog2.png'),
          _img('assets/images/dog3.png'),
          _img('assets/images/dog4.png'),
          _img('assets/images/dog5.png'),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(builder: (context) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                  'ListView', () => _onClickNavigator(context, ListViewPage()),
                  color: Colors.red),
              Button('Page 2', () => _onClickNavigator(context, HelloPage2()),
                  color: Colors.red),
              Button('Page 3', () => _onClickNavigator(context, HelloPage3()),
                  color: Colors.red)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button('Snack', () => _onClickSnack(context), color: Colors.red),
              Button('Dialog', () => _onClickDialog(context)),
              Button('Toast', () => _onClickToast("texto toast", color: Colors.green))
            ],
          )
        ],
      );
    });
  }

  _img(String img) {
    return Image.asset(img, fit: BoxFit.cover);
  }

  _text() {
    return Text(
      'Hello World',
      style: TextStyle(fontSize: 30, color: Colors.blue),
    );
  }
}
