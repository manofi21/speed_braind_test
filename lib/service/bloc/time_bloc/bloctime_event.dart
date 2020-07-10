import 'package:equatable/equatable.dart';

abstract class BloctimeEvent extends Equatable{
  const BloctimeEvent();
}

class TimeStart extends BloctimeEvent{
  final int startTime;
  TimeStart(this.startTime);

  @override
  List<Object> get props => [startTime];
}

class TimeUp extends BloctimeEvent{
  final int getScore;
  TimeUp(this.getScore);
  @override
  List<Object> get props => [getScore];
}