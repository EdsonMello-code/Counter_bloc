import 'package:counter/app/features/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  CounterViewState createState() => CounterViewState();
}

class CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  context.read<CounterCubit>().increment();
                }),
            FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                }),
          ],
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text(state.toString());
          },
        ),
      ),
    );
  }
}
