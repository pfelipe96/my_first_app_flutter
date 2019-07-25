import 'package:flutter/material.dart';
import 'package:flutter_app/data/Beer.dart';
import 'package:flutter_app/repository/API.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'List beers',
        home: Beers(),
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
      );
}

class BeersState extends State<Beers> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final List<Beer> _beers = <Beer>[];
  final List<Beer> _saved = <Beer>[];

  @override
  void initState() {
    super.initState();
    listenForBeers();
  }

  void listenForBeers() async {
    await API
        .getInstance()
        .getBeers()
        .then((onData) => setState(() => {_beers.addAll(onData)}));
  }

  Widget _buildBeers() {
    return ListView.builder(
        itemCount: _beers.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) =>
            i.isOdd ? Divider() : _buildRow(_beers[i]));
  }

  Widget _buildRow(Beer beer) {
    final alreadySaved = _saved.contains(beer);

    return ListTile(
      title: Text(
        beer.name,
        style: _biggerFont,
      ),
      trailing: Icon(
        Icons.favorite,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          alreadySaved ? _saved.remove(beer) : _saved.add(beer);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('List beers'),
        ),
        body: _buildBeers(),
      );
}

class Beers extends StatefulWidget {
  @override
  BeersState createState() => BeersState();
}
