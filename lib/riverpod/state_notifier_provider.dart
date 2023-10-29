import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(), //관리하는 클래스를 인스턴스화
); //StateNotifierProvider는 StateNotifier를 상속한 클래스를 상태관리해줌, 제너릭에는 <클래스명, 관리하는 상태타입> 넣어줌

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // StateNotifier는 반드시 어떤 타입을 상태관리할지 지정해줘야함

  ShoppingListNotifier()
      : super([
          ShoppingItemModel(
              name: '김치', quantity: 3, hasBought: false, isSpicy: true),
          ShoppingItemModel(
              name: '라면', quantity: 5, hasBought: false, isSpicy: true),
          ShoppingItemModel(
              name: '삼겹살', quantity: 10, hasBought: false, isSpicy: false),
          ShoppingItemModel(
              name: '케이크', quantity: 2, hasBought: false, isSpicy: false),
          ShoppingItemModel(
              name: '수박', quantity: 7, hasBought: false, isSpicy: false),
        ]); // 어떤 상태로 초기화할지 선언해줘야함

  void toggleHasBought({required String name}) {
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy)
            : e)
        .toList();
  }
}
