import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seek_qr_scanner/app/presentation/counter/bloc/counter_bloc.dart';
import 'package:seek_qr_scanner/app/presentation/counter/bloc/counter_event.dart';
import 'package:seek_qr_scanner/app/presentation/counter/bloc/counter_state.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (_, state) {
            return Text('${state.count}', style: textTheme.displayMedium);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed:
                () =>
                    context.read<CounterBloc>().add(CounterIncrementPressed()),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed:
                () =>
                    context.read<CounterBloc>().add(CounterDecrementPressed()),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_reset_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed:
                () => context.read<CounterBloc>().add(CounterReset(value: 5)),
          ),
        ],
      ),
    );
  }
}
