import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase provider,
      Object? previousValue, // 어떤 프로바이더든 업데이트가 되면 함수가 실행
      Object? newValue,
      ProviderContainer container) {
    print(
        '[Provider Updated] provider : $provider / pv:$previousValue / nv: $newValue');
  }

  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    // 프로바이더를 추가하면 함수실행
    print('[Provider Added] provider : $provider / value :$value ');
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    // 프로바이더가 삭제됐을때 실행
    print('[Provider Disposed] provider : $provider ');
  }
}
