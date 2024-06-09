import 'dart:ffi';
import 'package:drnik_calculator/bloc/common/bloc_base.dart';
import 'package:drnik_calculator/bloc/common/bloc_provider.dart';
import 'package:drnik_calculator/bloc/main_bloc.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
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
    // final MainBloc bloc = MainBloc();

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
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    const Text('Напиток #1'),
                    Row(
                      children: [
                        Column(
                          children: [
                            const Text('Крепость:'),
                            StreamBuilder(
                                stream: bloc?.outFirstValue,
                                builder: (context, AsyncSnapshot<double> snapshot) {
                                  return Text('${snapshot.data ?? 0}');
                                }
                            ),
                            Slider(
                                value: _currentSliderValue,
                                max: 100,
                                divisions: 25,
                                label: _currentSliderValue.round().toString(),
                                onChanged: (value) {
                                  bloc?.inEvent.add(value);
                                  setState(() {
                                    _currentSliderValue = value;
                                  });
                                }
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            const Text('Объём'),
                            StreamBuilder(
                                stream: bloc?.outFirstVolume,
                                builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                                  return Text('${snapshot.data ?? 0}');
                                }
                            ),
                            Slider(
                              value: _firstVolume,
                              max: 200,
                              divisions: 25,
                              label: _firstVolume.round().toString(),
                              onChanged: (double value) {
                                bloc?.inFirstVolumeEvent.add(value);
                                setState(() {
                                  _firstVolume = value;
                                });
                              },
                            ),
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

                    const Text('Drink #2'),
                    Row(
                      children: [
                        Column(
                          children: [
                            const Text('Крепость:'),
                            StreamBuilder(
                                stream: bloc?.outSecondValue,
                                builder: (context, AsyncSnapshot<double> snapshot) {
                                  return Text('${snapshot.data ?? 0}');
                                }
                            ),
                            Slider(
                              value: _secondSliderValue,
                              max: 100,
                              divisions: 25,
                              label: _secondSliderValue.round().toString(),
                              onChanged: (double value) {
                                bloc?.inSecondValueEvent.add(value);
                                setState(() {
                                  _secondSliderValue = value;
                                });
                              },
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            const Text('Объём'),
                            StreamBuilder(
                                stream: bloc?.outSecondVolume,
                                builder: (context, AsyncSnapshot<double> snapshot) {
                                  return Text('${snapshot.data ?? 0}');
                                }
                            ),
                            Slider(
                              value: _secondVolume,
                              max: 200,
                              divisions: 25,
                              label: _secondVolume.round().toString(),
                              onChanged: (double value) {
                                bloc?.inSecondVolumeEvent.add(value);
                                setState(() {
                                  _secondVolume = value;
                                });
                              },
                            ),
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

                    const Text('Напиток #3'),
                    Row(
                      children: [
                        Column(
                          children: [
                            const Text('Крепость:'),
                            StreamBuilder(
                                stream: bloc?.outThirdValue,
                                builder: (context, AsyncSnapshot<double> snapshot) {
                                  return Text('${snapshot.data ?? 0}');
                                }
                            ),
                            Slider(
                              value: _thirdSliderValue,
                              max: 100,
                              divisions: 25,
                              label: _thirdSliderValue.round().toString(),
                              onChanged: (double value) {
                                bloc?.inThirdValueEvent.add(value);
                                setState(() {
                                  _thirdSliderValue = value;
                                });
                              },
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            const Text('Объём'),
                            StreamBuilder(
                                stream: bloc?.outThirdVolume,
                                builder: (context, AsyncSnapshot<double> snapshot) {
                                  return Text('${snapshot.data ?? 0}');
                                }
                            ),
                            Slider(
                              value: _thirdVolume,
                              max: 200,
                              divisions: 25,
                              label: _thirdVolume.round().toString(),
                              onChanged: (double value) {
                                bloc?.inThirdVolumeEvent.add(value);
                                setState(() {
                                  _thirdVolume = value;
                                });
                              },
                            ),
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
                      padding: const EdgeInsets.all(4.0),
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

                    StreamBuilder(
                        stream: bloc?.outResultValue,
                        builder: (context, AsyncSnapshot<double> snapshot) {
                          return Text(
                              '${snapshot.data ?? 0}',
                              style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purpleAccent
                                ),
                          );
                        }
                    ),
                    // Text(
                    //   _result,
                    //   style: const TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.purpleAccent
                    //   ),
                    // ),

                  ],
                ),
              ),
            )
        )
    );
  }

  void calculate() {
    MainBloc? bloc = BlocProvider.of(_context);

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

    bloc?.inResultEvent.add(result.roundToDouble());
    setState(() {
      _result = result.roundToDouble().toString();
    });
  }

}
