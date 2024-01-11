import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}


class InsertItem extends SwitchEvent {

  const InsertItem({required this.id}) ;
  final int id;
  @override
  List<Object> get props => [id];
}

class EnableChange extends SwitchEvent {
  const EnableChange({required this.enable}) ;
  final bool enable;
  @override
  List<Object> get props => [enable];
}



class ProductList extends SwitchEvent {
  const ProductList({required this.productList}) ;

  final List<int> productList;

  @override
  List<Object> get props => [productList];
}


class CounterChange extends SwitchEvent {
  const CounterChange({required this.counter}) ;

  final int counter;

  @override
  List<Object> get props => [counter];
}

class SliderChange extends SwitchEvent {
  const SliderChange({required this.slider}) ;

  final double slider;

  @override
  List<Object> get props => [slider];
}
