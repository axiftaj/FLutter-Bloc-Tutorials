import 'package:bloc_tutorials/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_tutorials/bloc/counter_bloc/counter_events.dart';
import 'package:bloc_tutorials/bloc/switch_bloc/switch_states.dart';
import 'package:bloc_tutorials/view/counter/counter_screen.dart';
import 'package:bloc_tutorials/view/todo/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../form_valiation/form_sreen.dart';
import '../switch_button /switch_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Block Tutorials'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CounterScreen()));
                  },
                  title: const Text('Counter Example'),
                  subtitle: const Text('Simple exmaple to increment or decrement the counter'),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SwitchWidget()));
                  },
                  title: Text('Switch Button Example'),
                  subtitle: Text('Simple example to change the state of switch button with boolean'),
                ),
              ),

              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyForm()));
                  },
                  title: Text('Switch Button Example'),
                  subtitle: Text('Simple example to change the state of switch button with boolean'),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
                  },
                  title: Text('Favourite Screen'),
                  subtitle: Text('Let make favourote Item In List'),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
                  },
                  title: Text('Post'),
                  subtitle: Text('Post with lazy loading using bloc....'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
