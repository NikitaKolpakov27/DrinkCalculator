import 'dart:ffi';

import 'package:drnik_calculator/bloc/common/bloc_base.dart';
import 'package:drnik_calculator/bloc/common/bloc_provider.dart';
import 'package:drnik_calculator/bloc/main_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  double _currentSliderValue = 0;
  double _secondSliderValue = 0;
  double _thirdSliderValue = 0;

  double _firstVolume = 0;
  double _secondVolume = 0;
  double _thirdVolume = 0;
  String _result = '';

  final formKey = GlobalKey<FormState>();
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {

    final MainBloc? bloc = BlocProvider.of(context);

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
                  const Text('Напиток #1'),
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
                            // onChanged: (double value) {
                            //   setState(() {
                            //     _currentSliderValue = value;
                            //   });
                            // },
                            onChanged: (value) => bloc?.inEvent.add(MainBlocEvent.increaseFirstSliderValue),
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
                      StreamBuilder(
                          stream: bloc?.outFirstValue,
                          builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                            return Text(
                              "${snapshot.data ?? 0}"
                            );
                          }
                      )
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
                  const Divider(
                    endIndent: double.infinity,
                  ),

                  const Text('Drink #2'),
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text('Крепость:'),
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
                          const Text('Объём'),
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
                  const Divider(
                    endIndent: double.infinity,
                  ),
                  const Divider(
                    endIndent: double.infinity,
                  ),
                  const Divider(
                    endIndent: double.infinity,
                  ),

                  Text('Напиток #3'),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Крепость:'),
                          Slider(
                            value: _thirdSliderValue,
                            max: 100,
                            divisions: 25,
                            label: _thirdSliderValue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _thirdSliderValue = value;
                              });
                            },
                          ),
                          Text('Крепость: ${_thirdSliderValue.ceil()}'),
                        ],
                      ),

                      Column(
                        children: [
                          Text('Объём'),
                          Slider(
                            value: _thirdVolume,
                            max: 200,
                            divisions: 25,
                            label: _thirdVolume.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _thirdVolume = value;
                              });
                            },
                          ),
                          Text('Объём: ${_thirdVolume.ceil()}'),
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
                  const Divider(
                    endIndent: double.infinity,
                  ),

                  Padding(
                      padding: EdgeInsets.all(4.0),
                    child: MaterialButton(
                      color: Colors.deepPurple,
                      onPressed: calculate,
                      textColor: Colors.white,
                      child: const Text(
                          'Посчитать',
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ),
                  ),

                  const Text(
                      'Итоговая крепость:',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  Text(
                    _result,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purpleAccent
                    ),
                  ),

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
    final value3 = _thirdSliderValue;

    // Объемы:
    final vol1 = _firstVolume;
    final vol2 = _secondVolume;
    final vol3 = _thirdVolume;
    final total_vol = vol1 + vol2 + vol3;

    final result = (
        (value1 * vol1) + (value2 * vol2) + (value3 * vol3)
    ) / total_vol;

    setState(() {
      _result = result.roundToDouble().toString();
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
