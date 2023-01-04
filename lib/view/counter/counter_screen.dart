
import 'package:bloc_tutorials/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_tutorials/bloc/counter_bloc/counter_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CounterBloc , int>(
          builder: (BuildContext context, state) {
            return Center(child: Text(state.toString() ,
              style: TextStyle(color: Colors.red , fontSize: 50),));
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            context.read<CounterBloc>().add(CounterDecrementPressed());
          },child: Icon(Icons.minimize),),
          SizedBox(width: 10,),
          FloatingActionButton(onPressed: (){
            context.read<CounterBloc>().add(CounterIncrementPressed());
          },child: Icon(Icons.add),)
        ],
      ),
    );
  }
}