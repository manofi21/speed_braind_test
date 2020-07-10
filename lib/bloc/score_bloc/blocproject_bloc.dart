import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:speed_brain_test/bloc/score_bloc/bloc.dart';

class BlocprojectBloc extends Bloc<BlocprojectEvent, BlocprojectState> {
  static int i = cheecks();
  static int i2 = cheecks();
  // static List<String> bitLegth = (i + i2).toString().split('');
  // static int result = (bitLegth.toString().length != 2) ? (i + i2) : int.parse(bitLegth[1]);
  static int result = i + i2;
  static List<String> bitLegth = result.toString().split('');
  static int _result =
      (bitLegth.length == 2) ? int.parse(bitLegth[1]) : int.parse(bitLegth[0]);
  BlocprojectBloc() : super(BlocprojectInitial(i, i2, _result, 0));

  @override
  Stream<BlocprojectState> mapEventToState(
    BlocprojectEvent event,
  ) async* {
    // int i = state.props[0]; // = 0
    // int i2 = state.props[1]; // = 0
    int score = state.props[3];
    int i = cheecks();
    int i2 = cheecks();
    int result = i + i2;
    List<String> bitLegth = result.toString().split('');
    int _result = (bitLegth.length == 2)
        ? int.parse(bitLegth[1])
        : int.parse(bitLegth[0]);

    if (event is Add) {
      yield BlocprojectInitial(i, i2, _result, score + 1);
    } else if (event is Subtract) {
      yield BlocprojectInitial(i, i2, _result, score);
    }
  }
}

int cheecks() {
  Random random = new Random();
  int randomNumber = random.nextInt(9);
  return randomNumber;
}

/*
import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:speed_brain_test/bloc/bloc.dart';

class BlocprojectBloc extends Bloc<BlocprojectEvent, BlocprojectState> {
    static int i = cheecks();
    static int i2 = cheecks();
    static int result = i + i2;
    BlocprojectBloc() : super(BlocprojectInitial(i, i2, result));

  @override
  Stream<BlocprojectState> mapEventToState(
    BlocprojectEvent event,
  ) async* {
    // int i = state.props[0]; // = 0
    // int i2 = state.props[1]; // = 0
    if (event is Add) {
      // if(event.theOptions == result){
      yield BlocprojectInitial(i, i2, result);
      // }
    } else if (event is Subtract) {
      yield BlocprojectInitial(i, i2, result);
    }
  }
}

int cheecks() {
  Random random = new Random();
  int randomNumber = random.nextInt(9);
  return randomNumber;
}
 */
