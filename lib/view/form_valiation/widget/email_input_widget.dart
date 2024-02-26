import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/form_validation_bloc/my_form_bloc.dart';
import '../../../bloc/form_validation_bloc/my_form_events.dart';
import '../../../bloc/form_validation_bloc/my_form_states.dart';


class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MyFormBloc, MyFormState>(
        builder: (context, state){
          return TextFormField(
            initialValue: state.email.value,
            focusNode: focusNode,
            decoration: InputDecoration(
              icon: const Icon(Icons.email),
              labelText: 'Email',
              helperText: 'A complete, valid email e.g. joe@gmail.com',
              errorText: state.email.invalid ? 'Please ensure the email entered is valid'
                  : null,
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              context.read<MyFormBloc>().add(EmailChanged(email: value));
            },
            textInputAction: TextInputAction.next,
          );
        }
    );
  }
}