import 'dart:async';

import 'common/bloc_base.dart';

enum MainBlocEvent {
  increaseFirstSliderValue
}

class MainBloc extends BlocBase {

  double _currentSliderValue = 0;
  double _secondSliderValue = 0;
  double _thirdSliderValue = 0;

  double _firstVolume = 0;
  double _secondVolume = 0;
  double _thirdVolume = 0;
  String _result = '';

  // Stream controllers
  final StreamController<double> _firstSliderController = StreamController<double>();
  final StreamController<MainBlocEvent> _firstEventController =
      StreamController<MainBlocEvent>();

  Sink<double> get _inFirstValue => _firstSliderController.sink;
  Stream<double> get outFirstValue => _firstSliderController.stream;

  Sink<MainBlocEvent> get inEvent => _firstEventController.sink;
  Stream<MainBlocEvent> get _outEvent => _firstEventController.stream;

  MainBloc() {
    _outEvent.listen(_handleEvent);
  }

  //Альтернатива потоку с UI событиями
  void onIncreaseFirstValue() {
    _handleIncreaseFirstValue();
  }

  @override
  void dispose() {
    _firstEventController.close();
    _firstSliderController.close();
  }

  void _handleEvent(MainBlocEvent event) {
    switch (event) {

      case MainBlocEvent.increaseFirstSliderValue:
        _handleIncreaseFirstValue();
        break;

      default:
        assert(false, 'Should never reach there!');
        break;
    }
  }

  void _handleIncreaseFirstValue() {
    _currentSliderValue += 20;
    _inFirstValue.add(_currentSliderValue);
  }

}