import 'package:equatable/equatable.dart';

abstract class BlocprojectEvent extends Equatable{
  const BlocprojectEvent();
}

class Add extends BlocprojectEvent {
  // final int theOptions;
  // Add(this.theOptions); 
  @override
  List<Object> get props => [];
}

class Subtract extends BlocprojectEvent {
  @override
  List<Object> get props => [];
}
/*
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BlocprojectEvent{
  final int amount;
  const BlocprojectEvent(this.amount);
}

class Add extends BlocprojectEvent {
  Add(int amount) : super(amount);
}

class Subtract extends BlocprojectEvent{
  Subtract(int amount) : super(amount);
}
 */