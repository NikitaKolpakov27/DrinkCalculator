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
  final StreamController<MainBlocEvent> _firstValueEvent =
      StreamController<MainBlocEvent>();

  Sink<double> get _inFirstValue => _firstValueController.sink;
  Stream<double> get outFirstValue => _firstValueController.stream;

  Sink<MainBlocEvent> get inEvent => _firstValueEvent.sink;
  Stream<MainBlocEvent> get _outEvent => _firstValueEvent.stream;



  // Объем:
  final StreamController<double> _firstVolumeController = StreamController<double>();
  final StreamController<MainBlocEvent> _firstVolumeEvent =
  StreamController<MainBlocEvent>();

  Sink<double> get _inFirstVolume => _firstVolumeController.sink;
  Stream<double> get outFirstVolume => _firstVolumeController.stream;

  Sink<MainBlocEvent> get inFirstVolumeEvent => _firstVolumeEvent.sink;
  Stream<MainBlocEvent> get _outFirstVolumeEvent => _firstVolumeEvent.stream;

  /*
  *
  * 2-Й НАПИТОК:
  *
  * */

  // Крепость
  final StreamController<double> _secondValueController = StreamController<double>();
  final StreamController<MainBlocEvent> _secondValueEvent =
  StreamController<MainBlocEvent>();

  Sink<double> get _inSecondValue => _secondValueController.sink;
  Stream<double> get outSecondValue => _secondValueController.stream;

  Sink<MainBlocEvent> get inSecondValueEvent => _secondValueEvent.sink;
  Stream<MainBlocEvent> get _outSecondValueEvent => _secondValueEvent.stream;



  // Объем:
  final StreamController<double> _secondVolumeController = StreamController<double>();
  final StreamController<MainBlocEvent> _secondVolumeEvent =
  StreamController<MainBlocEvent>();

  Sink<double> get _inSecondVolume => _secondVolumeController.sink;
  Stream<double> get outSecondVolume => _secondVolumeController.stream;

  Sink<MainBlocEvent> get inSecondVolumeEvent => _secondVolumeEvent.sink;
  Stream<MainBlocEvent> get _outSecondVolumeEvent => _secondVolumeEvent.stream;


  MainBloc() {
    _outEvent.listen(_handleEvent);
    _outFirstVolumeEvent.listen(_handleEvent);

    _outSecondValueEvent.listen(_handleEvent);
    _outSecondVolumeEvent.listen(_handleEvent);
  }

  // Альтернатива потоку с UI событиями
  void onIncreaseFirstValue() {
    _handleIncreaseFirstValue();
  }

  @override
  void dispose() {
    // 1-й напиток
    _firstValueController.close();
    _firstValueEvent.close();

    _firstVolumeController.close();
    _firstVolumeEvent.close();


  }

  void _handleEvent(MainBlocEvent event) {
    switch (event) {

      // 1-й напиток:
      case MainBlocEvent.increaseFirstSliderValue:
        _handleIncreaseFirstValue();
        break;

      case MainBlocEvent.increaseFirstSliderVolume:
        _handleIncreaseFirstVolume();
        break;

      // 2-й напиток
      case MainBlocEvent.increaseSecondSliderValue:
        _handleIncreaseSecondValue();
        break;

      case MainBlocEvent.increaseSecondSliderVolume:
        _handleIncreaseSecondVolume();
        break;

      default:
        assert(false, 'Не реализовано другое!');
        break;
    }
  }

  // 1-й НАПИТОК:
  // Увеличить значение крепости для 1-го напитка
  void _handleIncreaseFirstValue() {
    _currentSliderValue += 20;
    _inFirstValue.add(_currentSliderValue);
  }

  void _handleIncreaseFirstVolume() {
    _firstVolume += 20;
    _inFirstVolume.add(_firstVolume);
  }


  // 2-й НАПИТОК:
  // Увеличить значение крепости для 1-го напитка
  void _handleIncreaseSecondValue() {
    _secondSliderValue += 20;
    _inSecondValue.add(_secondSliderValue);
  }

  void _handleIncreaseSecondVolume() {
    _secondVolume += 20;
    _inSecondVolume.add(_secondVolume);
  }

}