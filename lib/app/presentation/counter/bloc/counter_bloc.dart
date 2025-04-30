import 'package:bloc/bloc.dart';
import 'package:seek_qr_reader/app/presentation/counter/bloc/counter_event.dart';
import 'package:seek_qr_reader/app/presentation/counter/bloc/counter_state.dart';

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
