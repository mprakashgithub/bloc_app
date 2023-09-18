// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

enum NetworkState { fetching, error }

// class CounterState extends Equatable {
//   @override
//   // TODO: implement props
//   // List<Object?> get props => throw UnimplementedError();
//   List<Object?> get props => [];
// }

class CounterState extends Equatable {
  ///Define all the states
  // final NetworkState networkState;
  final int counterVal;
  // final String name;
  final bool nav = true;
  CounterState(this.counterVal);

  CounterState copyWith({
    int? counterVal,
    // String? name,
  }) {
    return CounterState(counterVal!);
  }

  @override
  // TODO: implement props
  // List<Object?> get props => throw UnimplementedError();
  List<Object?> get props => [counterVal];
}

class NavigateScreenState extends CounterState {
  NavigateScreenState(int counterVal) : super(0);
}
