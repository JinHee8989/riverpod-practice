import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 provider를 사용할지 결정할 고민할 필요 없도록
// Provider, FutureProvider, StreamProvider 어떤걸 쓸지 고민할 필요없도록
// StateNotifierProvider

final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

//@riverpod은 기본적으로 disposeProvider를 생성하고 그냥 provider를 생성하고 싶으면 @Riverpod()으로 해줘야함

@Riverpod(
  keepAlive:
      true, // 기본값으로 false인데 keepAlive가 true면 autoDispose가 안걸린 provider 생성됨)
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 20;
}

// 2) Parameter > family 파라미터를 일반 함수처럼 사용할 수 있도록
class Parameter {
  final int number1;
  final int number2;

  Parameter({required this.number1, required this.number2});
}

// (1)
final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, Parameter) => Parameter.number1 * Parameter.number2,
);

// (2)
@riverpod
int gStateMultiply(GStateMultiplyRef ref,
    {required int number1, required int number2}) {
  return number1 * number2;
}

// riverpod에서 이 2개는 동일함, 기존에 1번처럼 템플릿 코드들을 썼어야했는데 코드제너레이션으로 2번처럼 함수형식으로 쓸 수 있음

@riverpod
class GstateNotifier extends _$GstateNotifier {
  @override // 반드시 초기 상태값 지정해줘야 함
  int build() {
    return 0;
  }

  increment() {
    state++;
  }

  decrement() {
    state--;
  }
}
