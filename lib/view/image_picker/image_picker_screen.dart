

import 'dart:io';

import 'package:bloc_tutorials/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: BlocBuilder<ImagePickerBloc , ImagePickerState>(
            builder: (context, state){
              return state.file == null ? InkWell(
                onTap: (){
                  context.read<ImagePickerBloc>().add(GalleryPicker());
                },
                child: const CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.camera),

                ),
              ) : Image.file(File(state.file!.path.toString()),height: 200,width: 200,);
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          
        },
      ),
    );
  }
}
