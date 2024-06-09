import 'package:drnik_calculator/bloc/screen/new_screen.dart';
import 'package:flutter/material.dart';
import 'package:drnik_calculator/bloc/common/bloc_provider.dart';
import 'package:drnik_calculator/bloc/main_bloc.dart';
import 'package:drnik_calculator/bloc/screen/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

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
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = MainBloc();
    final NewScreen screen = NewScreen();

    return BlocProvider(
      bloc: bloc,
      child: screen,
    );
  }
}