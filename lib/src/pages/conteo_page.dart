import 'package:flutter/material.dart';

class ConteoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConteoPageState();
  }
}

class _ConteoPageState extends State<ConteoPage> {
  final _estilo = new TextStyle(fontSize: 30);

  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applicación 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Número de clicks',
              style: _estilo,
            ),
            Text(
              '$_conteo',
              style: _estilo,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _conteo++;
              });
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                if (_conteo > 0) _conteo--;
              });
            },
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
