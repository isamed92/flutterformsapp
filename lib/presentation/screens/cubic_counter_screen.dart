import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubic/counter_cubit.dart';

class CubicCounterScreen extends StatelessWidget {
  const CubicCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    final cubitActions = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        // title: Text('Cubic Counter: ${counterState.transactionCount}'),
        title: context.select((CounterCubit cubit) {
          return Text('Cubic Counter: ${cubit.state.transactionCount}');
        }),
        actions: [
          IconButton(
              onPressed: () => cubitActions.reset(),
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(child: BlocBuilder<CounterCubit, CounterState>(
        // buildWhen: (previous, current) => current.counter != previous.counter,
        builder: (context, state) {
          // print('counter cambio');
          return Text(
            'Counter Value: ${state.counter}',
            style: const TextStyle(fontSize: 20),
          );
        },
      )),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () => cubitActions.increaseBy(3),
          heroTag: '1',
          child: const Text('+3'),
        ),
        const SizedBox(
          height: 15,
        ),
        FloatingActionButton(
          onPressed: () => cubitActions.increaseBy(2),
          heroTag: '2',
          child: const Text('+2'),
        ),
        const SizedBox(
          height: 15,
        ),
        FloatingActionButton(
          onPressed: () => cubitActions.increaseBy(1),
          heroTag: '3',
          child: const Text('+1'),
        ),
      ]),
    );
  }
}
