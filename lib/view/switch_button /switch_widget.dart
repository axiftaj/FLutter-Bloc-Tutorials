import 'package:bloc_tutorials/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_tutorials/bloc/switch_bloc/switch_event.dart';
import 'package:bloc_tutorials/bloc/switch_bloc/switch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SwitchWidget extends StatelessWidget {
   const SwitchWidget({Key? key}) : super(key: key);


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text('Exmaple Two'),
       ),
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Text('Notifications') ,
                 BlocBuilder<SwitchBloc , SwitchStates>(
                     buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                     builder: (context, state){
                       return Switch(value: state.isSwitch, onChanged: (newValue){
                         context.read<SwitchBloc>().add(EnableOrDisableNotification());
                       });
                     }
                 )
               ],
             ),
             const SizedBox(height: 30,),
             BlocBuilder<SwitchBloc , SwitchStates>(
                 buildWhen: (previous, current) => previous.slider != current.slider,
                 builder: (context, state){
                   return  Container(
                     height: 200,
                     color:Colors.red.withOpacity(state.slider) ,
                   );

                 }
             )
             ,
             const SizedBox(height: 50,),
             BlocBuilder<SwitchBloc , SwitchStates>(
                 builder: (context, state){
                   return Slider(value: state.slider, onChanged: (value){
                     context.read<SwitchBloc>().add(SliderEvent(slider: value));
                   });
                 }
             )


           ],
         ),
       ),
     );
   }
}
