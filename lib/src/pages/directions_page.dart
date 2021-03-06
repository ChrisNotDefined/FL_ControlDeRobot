import 'package:flutter/material.dart';

class DirectionsPage extends StatefulWidget {
  DirectionsPage({Key key}) : super(key: key);

  @override
  _DirectionsPageState createState() => _DirectionsPageState();
}

class _DirectionsPageState extends State<DirectionsPage> {
  final _estilo = new TextStyle(fontSize: 50);
  BuildContext context;

  // Es nomas para nombrar las posciciones de los botones en la grid
  List<String> _keypad = ["", "front", "", "left", "", "right", "", "back", ""];

  // LA dirección que se va a mostrar en el Text40FF2D
  String _direccion = '';

  // Las coordendas del robot
  Map<String, int> coords = {'x': 0, 'y': 0};

  // Los límites de las coordenadas
  final Map<String, int> limits = {
    'x_min': 0,
    'x_max': 10,
    'y_min': 0,
    'y_max': 10
  };

  // La dirección a la que el robot está observando
  int dir = 0; // 0: up, 1: right, 2: down, 3: left

  void _displace(String direction) {
    switch (direction) {
      case 'front':
        switch (dir) {
          case 0:
            if (coords["y"] >= limits["y_max"]) {
              setState(() {
                _direccion = "Limite superior alcanzado";
              });
            } else {
              coords["y"]++;
              setState(() {
                _direccion = "Norte";
              });
            }
            break;
          case 1:
            if (coords["x"] >= limits["x_max"]) {
              setState(() {
                _direccion = "Limite derecho alcanzado";
              });
            } else {
              coords["x"]++;
              setState(() {
                _direccion = "Este";
              });
            }
            break;
          case 2:
            if (coords["y"] <= limits["y_min"]) {
              setState(() {
                _direccion = "Limite inferior alcanzado";
              });
            } else {
              coords["y"]--;
              setState(() {
                _direccion = "Sur";
              });
            }
            break;
          case 3:
            if (coords["x"] <= limits["x_min"]) {
              setState(() {
                _direccion = "Limite izquierdo alcanzado";
              });
            } else {
              coords["x"]--;
              setState(() {
                _direccion = "Oeste";
              });
            }
            break;
        }
        break;
      case 'back':
        switch (dir) {
          case 0:
            if (coords["y"] <= limits["y_min"]) {
              setState(() {
                _direccion = "Limite inferior alcanzado";
              });
            } else {
              coords["y"]--;
              setState(() {
                _direccion = "Norte";
              });
            }
            break;
          case 1:
            if (coords["x"] <= limits["x_min"]) {
              setState(() {
                _direccion = "Limite izquierdo alcanzado";
              });
            } else {
              coords["x"]--;
              setState(() {
                _direccion = "Este";
              });
            }
            break;
          case 2:
            if (coords["y"] >= limits["y_max"]) {
              setState(() {
                _direccion = "Limite superior alcanzado";
              });
            } else {
              coords["y"]++;
              setState(() {
                _direccion = "Sur";
              });
            }
            break;
          case 3:
            if (coords["x"] >= limits["x_max"]) {
              setState(() {
                _direccion = "Limite derecho alcanzado";
              });
            } else {
              coords["x"]++;
              setState(() {
                _direccion = "Oeste";
              });
            }
            break;
        }
        break;
      case 'left':
        if (dir == 0) {
          setState(() {
            _direccion = "Vuelta completa";
            dir = 3;
          });
        } else {
          dir--;
          setState(() {
            _direccion = "";
          });
        }
        break;
      case 'right':
        if (dir == 3) {
          setState(() {
            _direccion = 'Vuelta completa';
            dir = 0;
          });
        } else {
          dir++;
          setState(() {
            _direccion = "";
          });
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Desplazador', style: TextStyle(color: Colors.black)),
            centerTitle: true,
            backgroundColor: Color(0xFF63FF2D)),
        body: Column(children: [
          Text(
            'Dirección: ',
            style: _estilo,
          ),
          Text(
            '$_direccion',
            style: TextStyle(fontSize: 25),
          ),
          Expanded(
              child: GridView.count(
                  crossAxisCount: 3,
                  children: _keypad.map((el) {
                    return el != ""
                        ? Center(
                            child: Container(
                                height: 100,
                                width: 100,
                                child: FittedBox(
                                    child: FloatingActionButton(
                                  child: Text(el,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () {
                                    _displace(el);
                                  },
                                  backgroundColor: Color(0xFF63FF2D),
                                ))))
                        : Container();
                  }).toList()))
        ]));
  }
}
