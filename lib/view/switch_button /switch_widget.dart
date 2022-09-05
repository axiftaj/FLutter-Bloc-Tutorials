import 'dart:developer';

import 'package:bloc_tutorials/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_tutorials/bloc/switch_bloc/switch_event.dart';
import 'package:bloc_tutorials/bloc/switch_bloc/switch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SwitchWidget extends StatelessWidget {
   SwitchWidget({Key? key}) : super(key: key);

   int x = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asif Taj'),
      ),
      body: Column(
        children: [
          BlocBuilder<SwitchBloc , SwitchState>(
              builder: (context, value){
                return Column(
                  children: [
                    Switch(value: value.enable, onChanged: (newValue){
                      context.read<SwitchBloc>().add(EnableChange(enable: newValue));
                    }),
                  ],
                );
              }
          ),
          BlocBuilder<SwitchBloc , SwitchState>(
              builder: (context, state){
                return Text(state.counter.toString());
              }
          ),
          BlocBuilder<SwitchBloc , SwitchState>(
              builder: (context, state){
                return Slider(value: state.slider, onChanged: (value){
                  context.read<SwitchBloc>().add(SliderChange(slider: value));

                });
              }
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<SwitchBloc>().add(CounterChange(counter: 0));
          print('tap');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
