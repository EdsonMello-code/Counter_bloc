import 'package:counter/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class CounterView extends StatefulWidget {
  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final CounterCubit counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: ThemeData.dark().backgroundColor,
      appBar: AppBar(
          backgroundColor: ThemeData.dark().appBarTheme.backgroundColor,
          title: const Text('Counter')),
      body: Center(
        child: StreamBuilder(
          initialData: 0,
          stream: counterCubit.stream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text(snapshot.data.toString());
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => counterCubit.increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => counterCubit.decrement(),
          ),
        ],
      ),
    );
  }
}
