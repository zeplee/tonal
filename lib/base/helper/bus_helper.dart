//事件总线
import 'package:event_bus/event_bus.dart';

class BusHelper {
  static EventBus _bus;

  static post(event) {
    _bus.fire(event);
  }

  static observe<T>(void onData(T event),
      {Function onError, void onDone(), bool cancelOnError}) {
    _bus.on<T>().listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }
//
//  static add() {}
//
//  static remove() {}
}
