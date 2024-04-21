import 'package:bloc_tutorials/view/counter/counter_screen.dart';
import 'package:bloc_tutorials/view/favourite/favourite_screen.dart';
import 'package:bloc_tutorials/view/image_picker/image_picker_screen.dart';
import 'package:bloc_tutorials/view/todo/post_screen.dart';
import 'package:bloc_tutorials/view/todo/to_do_screen/to_do_screen.dart';
import 'package:flutter/material.dart';

import '../login/login_screen.dart';
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
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CounterScreen()));
                  },
                  title: const Text('Counter App'),
                  subtitle: const Text('Simple example to increment or decrement the counter'),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SwitchWidget()));
                  },
                  title: const Text('Some Bloc Example'),
                  subtitle: const Text('Switch button, counter exmaple and slider example with container'),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen()));
                  },
                  title: const Text('Favourite App'),
                  subtitle: const Text('Favourite App'),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePickerScreen()));
                  },
                  title: const Text('Image Picker Example'),
                  subtitle: const Text('Pick Image from gallery or capture image with camera'),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ToDoScreen()));
                  },
                  title: const Text('To Do App'),
                  subtitle: const Text('CRUD operations on list'),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                  title: const Text('Login'),
                  subtitle: const Text('Login with rest api with form validation using bloc '),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PostScreen()));
                  },
                  title: const Text('Get Post Api with bloc'),
                  subtitle: const Text('We will fetch the list of post using bloc'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
