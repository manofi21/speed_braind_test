import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/time_bloc/bloc.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Home(),
      home:
          BlocProvider(create: (context) => BloctimeBloc(), child: HomePage()),
    );
  }
}
/*
BlocBuilder<BloctimeBloc, BloctimeState>(
      bloc: BlocProvider.of<BloctimeBloc>(context),
      builder: (BuildContext context, BloctimeState state) {
        if (state is BloctimeInitial) {
          return FullWidgets(
            inits: 0,
          );
        } else if (state is TimeReturn) {
          return FullWidgets(
            inits: state.startTime,
          );
        }
      },
    );
*/

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => BloctimeBloc(), child: WidgetBLoC()),
    );
  }
}

class WidgetBLoC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BloctimeBloc, BloctimeState>(
      bloc: BlocProvider.of<BloctimeBloc>(context),
      builder: (BuildContext context, BloctimeState state) {
        if (state is BloctimeInitial) {
          return FullWidgets(
            inits: 0,
          );
        } else if (state is TimeReturn) {
          final weatherBloc = BlocProvider.of<BloctimeBloc>(context);
          // Future.delayed(Duration(seconds: 1), ()=> weatherBloc.add(TimeStart(state.startTime - 1)));
          Timer t = Timer(Duration(seconds: 1),
              () => weatherBloc.add(TimeStart(state.startTime - 1)));
          if (state.startTime == 0){
            t.cancel();
            weatherBloc.add(TimeUp());
          } // weatherBloc.add(TimeStart(state.startTime - 1));
          return FullWidgets(
            inits: state.startTime,
          );
        } else if (state is ShowScore) {
          return Center(
            child: Text("Time UP"),
          );
        }
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
