
import 'package:bloc_tutorials/bloc/counter_bloc/counter_events.dart';
import 'package:bloc_tutorials/bloc/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent , ConterState>{

  CounterBloc() : super(ConterState()){
    on<CounterIncrementPressed>(_increment);
    on<CounterDecrementPressed>(_decrement);
  }

  void _increment(CounterIncrementPressed event, Emitter<ConterState> emit) {
    emit(
      state.copyWith(counter: event.counter + 1),
    );
  }

  void _decrement(CounterDecrementPressed event, Emitter<ConterState> emit) {
    emit(
      state.copyWith(counter: event.counter - 1),
    );
  }

}