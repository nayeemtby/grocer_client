import 'package:get/get.dart';

class CartController extends GetxController {
  RxMap<String, CartItemData> cartItems = <String, CartItemData>{}.obs;
  RxDouble total = 0.0.obs;

  void add(String id, CartItemData item) {
    cartItems[id] = item;
    total.value += double.parse(item.price);
  }

  void updateItem(String id, int units) {
    if (cartItems[id] != null) {
      total.value +=
          (units - cartItems[id]!.units) * double.parse(cartItems[id]!.price);
      cartItems[id]!.units = units;
    }
  }

  void addUnit(String id) {
    if (cartItems[id] != null) {
      total.value += double.parse(cartItems[id]!.price);
      cartItems[id]!.units++;
    }
  }

  void reduceUnit(String id) {
    if (cartItems[id] != null) {
      total.value -= double.parse(cartItems[id]!.price);
      cartItems[id]!.units--;
    }
  }

  void removeItem(String id) {
    if (cartItems[id] != null) {
      total.value -= double.parse(cartItems[id]!.price) * cartItems[id]!.units;
      cartItems.remove(id);
    }
  }

  CartItemData? getItem(String id) {
    return cartItems[id];
  }
}

class CartItemData {
  CartItemData({
    this.price = '0.0',
    this.name = 'Cart Item',
    this.quantity = '-- unit',
    this.img,
    this.units = 1,
  });

  final String price;
  final String name;
  final String? img;
  final String quantity;
  int units;
}
