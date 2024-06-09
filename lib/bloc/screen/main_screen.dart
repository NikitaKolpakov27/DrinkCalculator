import 'package:drnik_calculator/bloc/common/bloc_base.dart';
import 'package:flutter/material.dart';
import 'package:drnik_calculator/bloc/common/bloc_provider.dart';
import 'package:drnik_calculator/bloc/main_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _slideValue = 0;

  @override
  Widget build(BuildContext context) {
    final MainBloc? bloc = BlocProvider.of(context);


    return Scaffold(
      appBar: AppBar(
        title: Text("My first BLoC app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: bloc?.outFirstValue,
              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                return Text(
                  "Bla bla ${snapshot.data}",
                );
              },
            ),
            Slider(
                value: _slideValue,
                max: 100,
                divisions: 20,
                onChanged: (value) {
                  bloc?.inEvent.add(value);
                  setState(() {
                    _slideValue = value;
                  });
                },
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => bloc?.inEvent.add(MainBlocEvent.increaseFirstSliderValue),
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}