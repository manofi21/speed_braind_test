import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service/bloc/score_bloc/bloc.dart';
import 'service/bloc/time_bloc/bloc.dart';

class WidgetCounter extends StatelessWidget {
  final int counterTime;
  const WidgetCounter(this.counterTime);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocprojectBloc, BlocprojectState>(
      bloc: BlocProvider.of<BlocprojectBloc>(context),
      builder: (BuildContext context, BlocprojectState state) {
        if (state is BlocprojectInitial) {
          return GritTest(
            count1: state.counter,
            count2: state.counter2,
            result: state.result,
            score: state.score,
            time: counterTime
          );
        }
      },
    );
  }
}

class GritTest extends StatelessWidget {
  final int count1, count2, result, score, time;
  const GritTest({
    Key key,
    this.count1,
    this.count2,
    this.result, 
    this.score,
    this.time,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final playPageBloc = BlocProvider.of<BlocprojectBloc>(context);
    final timeBloc = BlocProvider.of<BloctimeBloc>(context);
    if(time == 0) timeBloc.add(TimeUp(score));
    return Column(
      children: [
        Row(
          children: [
            Text("Score : $score"),
            SizedBox(width: 60),
            Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 3.0),
                borderRadius: BorderRadius.circular(8)),
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(20.0),
            child: Text(
              // ${result.toString()
              "${count1.toString()} + ${count2.toString()} = $result",
              style: Theme.of(context).textTheme.headline5,
            )),
            SizedBox(width: 60),
            Text("$time")
          ],
        ),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          scrollDirection: Axis.vertical,
          children: List.generate(9, (index) {
            return Center(
              child: InkWell(
                // onTap: () => print('${}'),
                onTap: () {
                  if (result == index + 1) playPageBloc.add(Add());
                  playPageBloc.add(Subtract());
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 3.0),
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(35.0),
                  child: Text(
                    '${index + 1}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            );
          }),
        ),
        InkWell(
          onTap: () {
            if (result == 0) playPageBloc.add(Add());
            playPageBloc.add(Subtract());
          },
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3.0),
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(35.0),
              child: Text(
                '0',
                style: Theme.of(context).textTheme.headline5,
              )),
        )
      ],
    );
  }
}