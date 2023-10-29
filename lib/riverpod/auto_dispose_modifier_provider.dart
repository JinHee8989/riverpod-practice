import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeModifierProvider = //autoDispose는 자동으로 캐시를 삭제하는것(futureProvider는 캐싱되어서 한번 조회하고나면 계속 가지고 있음), 처음부터 다시 생성함, 사용하지않을때 캐시 데이터를 삭제함.
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return [1, 2, 3, 4, 5];
});
