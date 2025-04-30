abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterReset extends CounterEvent {
  final int value;

  CounterReset({required this.value});
}
