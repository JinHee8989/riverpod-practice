import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/layout/default_layout.dart';
import 'package:riverpod_practice/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref
        .watch(numberProvider); //watch는 바라보고 있는 provider가 변경되면 다시 build합수를 실행
    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(numberProvider.notifier)
                        .update((state) => state + 1);
                  },
                  child: Text('UP')),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier).state =
                        ref.read(numberProvider.notifier).state - 1;
                  },
                  child: Text('DOWN')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => _NextScreen()));
                  },
                  child: Text('Next Screen'))
            ],
          ),
        ));
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(numberProvider.notifier)
                        .update((state) => state + 1);
                  },
                  child: Text('UP')),
            ],
          ),
        ));
  }
}
