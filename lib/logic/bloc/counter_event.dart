abstract class CounterEvent {}

class IncreaseCounterEvent extends CounterEvent {
  final int countVal;
  IncreaseCounterEvent({required this.countVal});
}

class DecreaseCounterEvent extends CounterEvent {
  DecreaseCounterEvent({required this.countVal});
  final int countVal;
}

class ChangeNameEvent extends CounterEvent {
  ChangeNameEvent({required this.name});
  final String name;
}

class NavigateToCallScreenEvent extends CounterEvent {
  NavigateToCallScreenEvent();
}
