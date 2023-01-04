import 'dart:developer';

import 'package:bloc_tutorials/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_tutorials/bloc/switch_bloc/switch_event.dart';
import 'package:bloc_tutorials/bloc/switch_bloc/switch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SwitchWidget extends StatelessWidget {
   SwitchWidget({Key? key}) : super(key: key);

   int x = 0 ;
   List<int> newValue = [] ;


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
          ),
          BlocBuilder<SwitchBloc , SwitchState>(
              builder: (context, state){
                return Expanded(child: ListView.builder(
                    itemCount: state.productList.length,
                    itemBuilder: (context,index){
                      return Text('value'+index.toString());
                }));
              }
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          x++;
          newValue.add(x);
          context.read<SwitchBloc>().add(ProductList(productList: newValue));

          context.read<SwitchBloc>().add(CounterChange(counter: x));
          print('tap');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
