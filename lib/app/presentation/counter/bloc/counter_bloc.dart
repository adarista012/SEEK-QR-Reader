import 'package:bloc/bloc.dart';
import 'package:seek_qr_scanner/app/presentation/counter/bloc/counter_state.dart';

import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncrementPressed>((event, emit) {
      emit(CounterState(state.count + 1));
    });

    on<CounterDecrementPressed>((event, emit) {
      emit(CounterState(state.count - 1));
    });

    on<CounterReset>((event, emit) {
      emit(CounterState(state.count - event.value));
    });
  }
}
