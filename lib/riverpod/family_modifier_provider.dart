import 'package:flutter_riverpod/flutter_riverpod.dart';

// provider를 생성할때 어떤 변수를 프로바이더 안의 로직을 변경할 때 쓰임
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
  // return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});
