import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model.dart';
import 'bloc/score_bloc/bloc.dart';

List<void> playPageVoid(PlayBlocModel playMolel) {
  final playPageBloc = BlocProvider.of<BlocprojectBloc>(playMolel.context);
  if (playMolel.result == playMolel.index + 1) playPageBloc.add(Add());
  playPageBloc.add(Subtract());
}

