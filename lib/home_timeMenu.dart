import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_playMenu.dart';
import 'service/bloc/time_bloc/bloc.dart';

class WidgetBLoC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BloctimeBloc, BloctimeState>(
      bloc: BlocProvider.of<BloctimeBloc>(context),
      builder: (context, state) {
        if (state is BloctimeInitial) {
          return FullWidgets(
            inits: 0,
          );
        } else if (state is TimeReturn) {
          final weatherBloc = BlocProvider.of<BloctimeBloc>(context);
          Timer t = Timer(Duration(seconds: 1),
              () => weatherBloc.add(TimeStart(state.startTime - 1)));
          if (state.startTime == 0) {
            t.cancel();
          }
          return WidgetCounter(state.startTime);
        } else if (state is ShowScore) {
          return Center(
            child: Text("Time UP \n Your Score : ${state.showScore}"),
          );
        }
        return Container();
      },
    );
  }
}

class FullWidgets extends StatelessWidget {
  final int inits;
  const FullWidgets({Key key, this.inits}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            inits.toString(),
            style: TextStyle(fontSize: 20),
          ),
          FlatButton(
              onPressed: () {
                final weatherBloc = BlocProvider.of<BloctimeBloc>(context);
                weatherBloc.add(TimeStart(60));
              },
              child: Text("start"))
        ],
      ),
    );
  }
}
