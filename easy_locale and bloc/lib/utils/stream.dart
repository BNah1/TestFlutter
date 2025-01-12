import 'dart:async';

class MyStream {
  final int _start;
  int _current;
  late StreamController<int> _streamController;
  late  StreamSubscription<int> _subscription;

  MyStream(this._start) : _current = _start {
    _streamController = StreamController<int>.broadcast();
    _onStart();
  }
  Stream<int> get stream => _streamController.stream;

  _onStart(){
    _subscription = Stream.periodic(
      Duration(seconds: 1),
        (computation){
          return _current - computation;
        }
    ).listen((event){
      if (event >= 0) {
        if (!_streamController.isClosed) {
          _streamController.sink.add(event);
        }
      }
      if(event == 0){
        _subscription.cancel();
      }
    });
  }

  void onReset(){
    _subscription.cancel();
    _streamController.sink.add(_start);
    _onStart();
  }

  void onPause(){
    _subscription.pause();
  }

  void onResume() {
    _subscription.resume();
  }


  void dispose() {
    _subscription.cancel();
    _streamController.close();
  }
}