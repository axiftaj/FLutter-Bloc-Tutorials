import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../bloc/form_validation_bloc/my_form_bloc.dart';
import '../../../bloc/form_validation_bloc/my_form_events.dart';
import '../../../bloc/form_validation_bloc/my_form_states.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return  state.status.isSubmissionInProgress ? const CircularProgressIndicator() : ElevatedButton(
          onPressed: state.status.isValidated
              ? () => context.read<MyFormBloc>().add(FormSubmitted())
              : null,
          child:  const Text('Submit'),
        );
      },
    );
  }
}