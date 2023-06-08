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
        title: const Text('Block Tutorials'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CounterScreen()));
                  },
                  title: const Text('Counter Example'),
                  subtitle: const Text('Simple example to increment or decrement the counter'),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SwitchWidget()));
                  },
                  title: const Text('Some Bloc Example'),
                  subtitle: const Text('Switch button, counter exmaple and slider example with container'),
                ),
              ),

              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyForm()));
                  },
                  title: const Text('Login Form Validation'),
                  subtitle: const Text('Simple login form to validating using bloc '),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PostScreen()));
                  },
                  title: const Text('Get Post Api with bloc'),
                  subtitle: const Text('We will fetch the list of post using bloc'),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
                  },
                  title: const Text('Post'),
                  subtitle: const Text('Post with lazy loading using bloc....'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
