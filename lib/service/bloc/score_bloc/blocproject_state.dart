import 'package:equatable/equatable.dart';

abstract class BlocprojectState extends Equatable{
  const BlocprojectState();
}

class BlocprojectInitial extends BlocprojectState {
  final int counter, counter2, result, score;
  BlocprojectInitial(this.counter, this.counter2, this.result, this.score);

  @override
  List<Object> get props => [counter, counter2, result, score];
}


// class BlocprojectResult extends BlocprojectState{
//   @override
//   List<Object> get props => [];

// }
