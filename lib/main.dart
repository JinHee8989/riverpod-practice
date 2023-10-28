import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/screen/home_screen.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
          home: HomeScreen()))); //상위에 providerScope가 있어서 provider를 쓸수있음
}
