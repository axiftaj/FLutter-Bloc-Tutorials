

import 'package:bloc_tutorials/bloc/switch_bloc/switch_event.dart';
import 'package:bloc_tutorials/bloc/switch_bloc/switch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SwitchBloc extends Bloc<SwitchEvent , SwitchState>{

  SwitchBloc(): super(SwitchState()){
    on<EnableChange>(enable);
    on<CounterChange>(increment);
    on<SliderChange>(slider);
    on<ProductList>(productList);
  }

  void enable(EnableChange event, Emitter<SwitchState> emit) {
    emit(
      state.copyWith(enable: event.enable)
    );
  }

  void increment(CounterChange event, Emitter<SwitchState> emit) {
    emit(
        state.copyWith(counter:   event.counter)
    );
  }

  void slider(SliderChange event, Emitter<SwitchState> emit) {
    emit(
        state.copyWith(slider:   event.slider)
    );
  }


  void productList(ProductList event, Emitter<SwitchState> emit) {
    emit(
        state.copyWith(productList:   event.productList)
    );
  }

}