import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/score_bloc/bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fake Weather App"),
        ),
        body:
            // BlocProvider(
            //     create: (context) => BlocprojectBloc(), child:GritTest())
            BlocProvider(
                create: (context) => BlocprojectBloc(),
                child: WidgetCounter()));
  }
}

class WidgetCounter extends StatelessWidget {
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
          );
        }
      },
    );
  }
}

class GritTest extends StatelessWidget {
  final int count1, count2, result, score;
  const GritTest({
    Key key,
    this.count1,
    this.count2,
    this.result, 
    this.score,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<BlocprojectBloc>(context);
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
            Text("")
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
                  if (result == index + 1) weatherBloc.add(Add());
                  weatherBloc.add(Subtract());
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
            if (result == 0) weatherBloc.add(Add());
            weatherBloc.add(Subtract());
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
