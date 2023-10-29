import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_practice/riverpod/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleStreamProvider);
    return DefaultLayout(
        title: 'StreamProviderScreen',
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            state.when(
                data: (data) {
                  return Text(
                    data.toString(),
                    textAlign: TextAlign.center,
                  );
                },
                error: (err, stack) => Text(err.toString()),
                loading: () => Center(
                      child: CircularProgressIndicator(),
                    ))
          ],
        ));
  }
}
