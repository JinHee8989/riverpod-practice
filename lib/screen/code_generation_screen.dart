import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/layout/default_layout.dart';
import 'package:riverpod_practice/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(number1: 10, number2: 20));
    final state5 = ref.watch(gstateNotifierProvider);

    return DefaultLayout(
        title: 'CodeGenerationScreen',
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('State1 : $state1'),
            state2.when(
                data: (data) {
                  return Text(
                    'State2 : $data',
                    textAlign: TextAlign.center,
                  );
                },
                error: (err, stack) => Text(err.toString()),
                loading: () => Center(
                      child: CircularProgressIndicator(),
                    )),
            state3.when(
                data: (data) {
                  return Text(
                    'State3 : $data',
                    textAlign: TextAlign.center,
                  );
                },
                error: (err, stack) => Text(err.toString()),
                loading: () => Center(
                      child: CircularProgressIndicator(),
                    )),
            Text('State4 : $state4'),
            Text('State5 : $state5'),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref
                          .read(gstateNotifierProvider.notifier)
                          .increment(); // 일시적으로 provider를 불러올땐 watch가 아닌 read임
                    },
                    child: Text('Increment')),
                ElevatedButton(
                    onPressed: () {
                      ref
                          .read(gstateNotifierProvider.notifier)
                          .decrement(); // 일시적으로 provider를 불러올땐 watch가 아닌 read임
                    },
                    child: Text('Decrement'))
              ],
            )
          ],
        ));
  }
}
