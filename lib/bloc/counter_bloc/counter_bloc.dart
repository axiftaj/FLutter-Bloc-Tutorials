
import 'package:bloc_tutorials/bloc/counter_bloc/counter_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent , int>{

  CounterBloc() : super(0){
    on<CounterIncrementPressed>(_increment);
    on<CounterDecrementPressed>(_decrement);
  }

  void _increment(CounterIncrementPressed event, Emitter<int> emit) {
    emit(
      state + 1,
    );
  }

  void _decrement(CounterDecrementPressed event, Emitter<int> emit) {
    emit(
      state - 1,
    );
  }

}