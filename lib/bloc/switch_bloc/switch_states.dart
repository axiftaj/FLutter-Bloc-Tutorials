import 'package:equatable/equatable.dart';

class SwitchStates extends Equatable {

  final bool isSwitch ;
  final double slider ;

  const SwitchStates({
    this.isSwitch = false ,
    this.slider = 1.0
  });


  SwitchStates copyWith({bool? isSwitch , double? slider }){
    return SwitchStates(
      isSwitch : isSwitch ?? this.isSwitch ,
      slider : slider ?? this.slider ,
    );
  }

  @override
  List<Object?> get props => [isSwitch, slider];
}