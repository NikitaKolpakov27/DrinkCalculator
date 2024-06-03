import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  double _currentSliderValue = 0;
  double _secondSliderValue = 0;

  double _firstVolume = 0;
  double _secondVolume = 0;
  String _result = '';

  final formKey = GlobalKey<FormState>();
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text(
              "DrinkCalculator",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 24,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Text('Drink #1'),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Крепость:'),
                          Slider(
                            value: _currentSliderValue,
                            max: 100,
                            divisions: 25,
                            label: _currentSliderValue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                              });
                            },
                          ),
                          Text('Крепость: ${_currentSliderValue.ceil()}'),
                        ],
                      ),

                      Column(
                        children: [
                          Text('Объём'),
                          Slider(
                            value: _firstVolume,
                            max: 200,
                            divisions: 25,
                            label: _firstVolume.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _firstVolume = value;
                              });
                            },
                          ),
                          Text('Объём: ${_firstVolume.ceil()}'),
                        ],
                      ),
                    ],
                  ),

                  const Divider(
                    endIndent: double.infinity,
                  ),
                  const Divider(
                    endIndent: double.infinity,
                  ),
                  const Divider(
                    endIndent: double.infinity,
                  ),

                  Text('Drink #2'),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Крепость:'),
                          Slider(
                            value: _secondSliderValue,
                            max: 100,
                            divisions: 25,
                            label: _secondSliderValue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _secondSliderValue = value;
                              });
                            },
                          ),
                          Text('Крепость: ${_secondSliderValue.ceil()}'),
                        ],
                      ),

                      Column(
                        children: [
                          Text('Объём'),
                          Slider(
                            value: _secondVolume,
                            max: 200,
                            divisions: 25,
                            label: _secondVolume.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _secondVolume = value;
                              });
                            },
                          ),
                          Text('Объём: ${_secondVolume.ceil()}'),
                        ],
                      ),
                    ],
                  ),

                  const Divider(
                    endIndent: double.infinity,
                  ),

                  Padding(
                      padding: EdgeInsets.all(4.0),
                    child: MaterialButton(
                      color: Colors.deepPurple,
                      onPressed: calculate,
                    ),
                  ),

                  Text('Result is: $_result'),

                ],
              ),
            ),
          )
        )
    );
  }

  void calculate() {
    final value1 = _currentSliderValue; // 40
    final value2 = _secondSliderValue; // 0

    // Объемы:
    final vol1 = _firstVolume;
    final vol2 = _secondVolume;
    final total_vol = vol1 + vol2;

    final result = ( (value1 * vol1) + (value2 * vol2) ) / total_vol;
    setState(() {
      _result = result.ceil().toString();
    });
  }

}

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slider(
        value: _currentSliderValue,
        max: 100,
        divisions: 10,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
