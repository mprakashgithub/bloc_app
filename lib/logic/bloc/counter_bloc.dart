// import 'package:bloc/bloc.dart';
// import 'package:blocapiyt/logic/bloc/counter_event.dart';
// import 'package:blocapiyt/logic/bloc/counter_state.dart';

import 'package:bloc_app/logic/bloc/counter_event.dart';
import 'package:bloc_app/logic/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  ///Define entire varibales
  late int counterVal;
  late String name;
  CounterBloc() : super(CounterState(0)) {
    // on<CounterEvent>((event, emit) {
    //     TODO: implement event handler
    // });
    on<IncreaseCounterEvent>((event, emit) {
      print(event.countVal);
      emit(state.copyWith(counterVal: state.counterVal + 1));
    });
    on<DecreaseCounterEvent>((event, emit) {
      emit(state.copyWith(counterVal: state.counterVal - 1));
    });
    // on<ChangeNameEvent>((event, emit) {
    //   emit(state.copyWith(name: state.name));
    // });
    on<NavigateToCallScreenEvent>((event, emit) {
      emit(NavigateScreenState(counterVal));
    });
  }
}
