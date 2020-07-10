import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_playMenu.dart';
import 'home_timeMenu.dart';
import 'service/bloc/score_bloc/bloc.dart';
import 'service/bloc/time_bloc/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocprojectBloc>(
          create: (context) => BlocprojectBloc(),
        ),
        BlocProvider<BloctimeBloc>(
          create: (context) => BloctimeBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Fake Weather App"),
            ),
            body: WidgetBLoC()),
        // home:
        //     BlocProvider(create: (context) => BloctimeBloc(), child: HomePage()),
      ),
    );
  }
}
