import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const initString = 'This is first string data.';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Data(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: MyText(),
        ),
        body: Level1(),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Level3(),
        MyTextField(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyText();
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<Data>().data == initString
          ? initString
          : context.watch<Data>().data,
    );
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<Data>().changeString(value);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String _data = initString;
  String get data => _data;

  void changeString(String newString) {
    _data = newString;
    notifyListeners();
  }
}
