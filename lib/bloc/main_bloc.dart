import 'dart:async';

import 'common/bloc_base.dart';

enum MainBlocEvent {
  increaseFirstSliderValue,
  increaseFirstSliderVolume,

  // second
  increaseSecondSliderValue,
  increaseSecondSliderVolume,

  // third
  increaseThirdSliderValue,
  increaseThirdSliderVolume
}

class MainBloc extends BlocBase {

  // Крепости
  double _currentSliderValue = 0;
  double _secondSliderValue = 0;
  double _thirdSliderValue = 0;

  // Объемы
  double _firstVolume = 0;
  double _secondVolume = 0;
  double _thirdVolume = 0;

  double get getFirstVolume => _firstVolume;

  String _result = '';

  // Контроллеры

  /*
  *
  * 1-Й НАПИТОК:
  *
  * */

  // Крепость
  final StreamController<double> _firstValueController = StreamController<double>();
  final StreamController<double> _firstValueEvent =
      StreamController<double>();

  Sink<double> get _inFirstValue => _firstValueController.sink;
  Stream<double> get outFirstValue => _firstValueController.stream;

  Sink<double> get inEvent => _firstValueEvent.sink;
  Stream<double> get _outEvent => _firstValueEvent.stream;



  // Объем:
  final StreamController<double> _firstVolumeController = StreamController<double>();
  final StreamController<double> _firstVolumeEvent =
  StreamController<double>();

  Sink<double> get _inFirstVolume => _firstVolumeController.sink;
  Stream<double> get outFirstVolume => _firstVolumeController.stream;

  Sink<double> get inFirstVolumeEvent => _firstVolumeEvent.sink;
  Stream<double> get _outFirstVolumeEvent => _firstVolumeEvent.stream;

  /*
  *
  * 2-Й НАПИТОК:
  *
  * */

  // Крепость
  final StreamController<double> _secondValueController = StreamController<double>();
  final StreamController<double> _secondValueEvent =
  StreamController<double>();

  Sink<double> get _inSecondValue => _secondValueController.sink;
  Stream<double> get outSecondValue => _secondValueController.stream;

  Sink<double> get inSecondValueEvent => _secondValueEvent.sink;
  Stream<double> get _outSecondValueEvent => _secondValueEvent.stream;



  // Объем:
  final StreamController<double> _secondVolumeController = StreamController<double>();
  final StreamController<double> _secondVolumeEvent =
  StreamController<double>();

  Sink<double> get _inSecondVolume => _secondVolumeController.sink;
  Stream<double> get outSecondVolume => _secondVolumeController.stream;

  Sink<double> get inSecondVolumeEvent => _secondVolumeEvent.sink;
  Stream<double> get _outSecondVolumeEvent => _secondVolumeEvent.stream;



  /*
  *
  * 3-Й НАПИТОК:
  *
  * */

  // Крепость
  final StreamController<double> _thirdValueController = StreamController<double>();
  final StreamController<double> _thirdValueEvent =
  StreamController<double>();

  Sink<double> get _inThirdValue => _thirdValueController.sink;
  Stream<double> get outThirdValue => _thirdValueController.stream;

  Sink<double> get inThirdValueEvent => _thirdValueEvent.sink;
  Stream<double> get _outThirdValueEvent => _thirdValueEvent.stream;



  // Объем:
  final StreamController<double> _thirdVolumeController = StreamController<double>();
  final StreamController<double> _thirdVolumeEvent =
  StreamController<double>();

  Sink<double> get _inThirdVolume => _thirdVolumeController.sink;
  Stream<double> get outThirdVolume => _thirdVolumeController.stream;

  Sink<double> get inThirdVolumeEvent => _thirdVolumeEvent.sink;
  Stream<double> get _outThirdVolumeEvent => _thirdVolumeEvent.stream;




  /*
  *
  * ИТОГОВАЯ КРЕПОСТЬ:
  *
  * */

  // Крепость
  final StreamController<double> _resultController = StreamController<double>();
  final StreamController<double> _resultEvent = StreamController<double>();

  Sink<double> get _inResultValue => _resultController.sink;
  Stream<double> get outResultValue => _resultController.stream;

  Sink<double> get inResultEvent => _resultEvent.sink;
  Stream<double> get _outResultEvent => _resultEvent.stream;



  MainBloc() {
    _outEvent.listen(_addFirstValue);
    _outFirstVolumeEvent.listen(_addFirstVolume);

    _outSecondValueEvent.listen(_addSecondValue);
    _outSecondVolumeEvent.listen(_addSecondVolume);

    _outThirdValueEvent.listen(_addThirdValue);
    _outThirdVolumeEvent.listen(_addThirdVolume);

    _outResultEvent.listen(_makeResult);
  }

  @override
  void dispose() {
    // 1-й напиток
    _firstValueController.close();
    _firstValueEvent.close();

    _firstVolumeController.close();
    _firstVolumeEvent.close();


    // 2-й напиток
    _secondValueController.close();
    _secondValueEvent.close();

    _secondVolumeController.close();
    _secondVolumeEvent.close();


    // 3-й напиток
    _thirdValueController.close();
    _thirdValueEvent.close();

    _thirdVolumeController.close();
    _thirdVolumeEvent.close();
  }

  void _addFirstValue(double value) {
    _inFirstValue.add(value);
  }

  void _addFirstVolume(double volume) {
    _inFirstVolume.add(volume);
  }


  void _addSecondValue(double value) {
    _inSecondValue.add(value);
  }

  void _addSecondVolume(double volume) {
    _inSecondVolume.add(volume);
  }


  void _addThirdValue(double value) {
    _inThirdValue.add(value);
  }

  void _addThirdVolume(double volume) {
    _inThirdVolume.add(volume);
  }

  void _makeResult(double result_value) {
    // final value1 = _currentSliderValue;
    // final value2 = _secondSliderValue;
    // final value3 = _thirdSliderValue;
    //
    // // Объемы:
    // final vol1 = _firstVolume;
    // final vol2 = _secondVolume;
    // final vol3 = _thirdVolume;
    // final total_vol = vol1 + vol2 + vol3;
    //
    // final result = (
    //     (value1 * vol1) + (value2 * vol2) + (value3 * vol3)
    // ) / total_vol;

    _inResultValue.add(result_value);
  }

}