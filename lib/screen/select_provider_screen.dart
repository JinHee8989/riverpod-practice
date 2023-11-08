import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/layout/default_layout.dart';
import 'package:riverpod_practice/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ** select로 불필요한 렌더링을 막을 수 있음. 최적화 개념
    final state = ref.watch(selectProvider); //watch는 build를 재실행함
    // final state = ref.watch(selectProvider
    //     .select((value) => value.isSpicy)); //isSpicy가 변경될때만 다시 build되도록 하고싶은 경우
    ref.listen(selectProvider.select((value) => value.hasBought),
        (previous, next) {
      print('next: $next');
    });

    return DefaultLayout(
        title: "SelectProviderScreen",
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(state.toString()),
            Text(state.name),
            Text(state.isSpicy.toString()),
            Text(state.hasBought.toString()),
            ElevatedButton(
                onPressed: () {
                  ref.read(selectProvider.notifier).toggleIsSpicy();
                },
                child: Text('Spicy Toggle')),
            ElevatedButton(
                onPressed: () {
                  ref.read(selectProvider.notifier).toggleHasBought();
                },
                child: Text('HasBought Toggle')),
          ],
        ));
  }
}
