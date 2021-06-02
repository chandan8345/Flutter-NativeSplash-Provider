import 'package:bhgroup/Counter.dart';
import 'package:bhgroup/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void _incrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).increment();
  }

  void _decrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).decrement();
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context).getCounter;
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () => () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              tooltip: 'Increment',
              child: Icon(Icons.home),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () => _incrementCounter(context),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () => _decrementCounter(context),
              tooltip: 'Increment',
              child: Icon(Icons.remove),
            ),
          ],
        ));
  }
}
