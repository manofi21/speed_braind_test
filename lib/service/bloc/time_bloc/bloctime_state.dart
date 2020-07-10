import 'package:equatable/equatable.dart';

abstract class BloctimeState extends Equatable {
  const BloctimeState();
}

class BloctimeInitial extends BloctimeState {
  @override
  List<Object> get props => [];
}

class TimeReturn extends BloctimeState {
  final int startTime;
  TimeReturn(this.startTime);

  @override
  List<Object> get props => [startTime];
}

class ShowScore extends BloctimeState {
  final int showScore;
  ShowScore(this.showScore);
  @override
  List<Object> get props => [showScore];
}
