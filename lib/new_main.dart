import 'package:flutter/material.dart';
import 'package:drnik_calculator/bloc/common/bloc_provider.dart';
import 'package:drnik_calculator/bloc/main_bloc.dart';
import 'package:drnik_calculator/bloc/screen/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = MainBloc();
    final MainScreen screen = MainScreen();

    // then use them to create provider instance
    return BlocProvider(
      bloc: bloc,
      child: screen,
    );
  }
}