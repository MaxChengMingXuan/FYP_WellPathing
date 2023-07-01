import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _counter = 0;
  IconData _icon = Icons.pets;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter % 2 == 0) {
        _icon = Icons.favorite;
      } else {
        _icon = Icons.pets;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pop Pet'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                    width: 100,
                    child: Icon(
                      _icon,
                      size: 100,
                    )),
                SizedBox(height: 10),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 150),
                SizedBox(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: _incrementCounter,
                    child: Text('Pop!', style: TextStyle(fontSize: 32)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
