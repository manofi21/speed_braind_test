import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';

class BloctimeBloc extends Bloc<BloctimeEvent, BloctimeState> {
  BloctimeBloc() : super(BloctimeInitial());

  @override
  Stream<BloctimeState> mapEventToState(
    BloctimeEvent event,
  ) async*{
    if (event is TimeStart) {
      yield TimeReturn(event.startTime);
    }else if(event is TimeUp){
      yield ShowScore(0);
    }
  }
}

// void startTimes(int i, VoidCallback _voids){
  // Timer.periodic(Duration(seconds: 1), (timer) {
  //   if (i == 0){
  //     timer.cancel();
  //   } else {
  //     _voids();
  //   }
//   });
// }

/*
                  Timer.periodic(Duration(seconds: 1), (timer) {

                  });
*/
