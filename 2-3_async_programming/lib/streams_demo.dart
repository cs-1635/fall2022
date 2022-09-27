import 'dart:async';
import 'dart:io';
import 'dart:math';

Stream<int> _randomNumbersAsyncGenerator() async* {
  final random = Random();

  for(int i = 0; i < 25; ++i){
    await Future.delayed(Duration(seconds: 1));
    yield random.nextInt(100);
  }
}

Iterable<int> _randomNumbersSyncGenerator() sync* {
  final random = Random();
  for(int i = 0; i < 25; ++i){
    sleep(Duration(seconds:1));
    yield random.nextInt(100);
  }
}


void randomNumbersAsyncSubscriber() async {

  final stream = _randomNumbersAsyncGenerator();

  await for(int value in stream) {
    print(value);
  }

  print("Async stream example");
}


void randomNumbersSyncSubscriber()  {

  final stream = _randomNumbersSyncGenerator();

   for(int value in stream) {
    print(value);
  }

  print("Sync stream example");
}







class RandomNumberStream{

  final int maxValue;
  static final _random = Random();

  Timer? _timer;
  late int _currentCount;
  late StreamController<int> _controller;

  Stream<int>  get stream => _controller.stream;

  void _stopTimer () {
    _timer?.cancel();
    _controller.close();
  }

  void _runStream (Timer timer) {
    _currentCount++;
    _controller.add(_random.nextInt(maxValue));

    if(_currentCount == maxValue)
      _stopTimer();
  }

  void _startStream() {
    _timer = Timer.periodic(Duration(seconds: 1), _runStream);
    _currentCount = 0;
  }

  RandomNumberStream({this.maxValue = 100}) {
    // aside:  { optional *named parameter, vs [ unnamed positional parameter

    _currentCount = 0;
    _controller =
        StreamController<int>( // aside: in dart 2.0 new was made optional
            onListen: _startStream,
            onResume: _startStream,
            onPause: _stopTimer,
            onCancel: _stopTimer
        );
  }
}


void streamControllerExample() async {

  final stream = RandomNumberStream().stream;

  await Future.delayed(Duration(seconds:2));

  final subscription = stream.listen((int random) {
    print(random);
  });

  await Future.delayed(Duration(seconds:4));

  subscription.cancel();


}
