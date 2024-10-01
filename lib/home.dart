import 'package:bloc_practice/cubit/counter_cubit.dart';
import 'package:bloc_practice/cubit/counter_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bloc practice'),
        ),
        body: BlocBuilder<CounterCubit, CounterCubitState>(
          builder: (context, state) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      context.read<CounterCubit>().counterIncrease();
                    },
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  (state is CounterValueUpdated)
                      ? Text(state.counter.toString())
                      : const Text('0'),
                  const SizedBox(
                    width: 60,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context.read<CounterCubit>().counterDecrease();
                    },
                    child: const Icon(Icons.remove),
                  )
                ],
              ),
            );
          },
        ));
  }
}
