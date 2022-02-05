import 'package:get/get.dart';

class CartController extends GetxController {
  RxMap<String, CartItemData> cartItems = <String, CartItemData>{}.obs;
  RxDouble total = 0.0.obs;

  void add(String id, CartItemData item) {
    CartItemData? cartItem = cartItems[id];
    if (cartItem == null) {
      cartItems[id] = item;
      total.value = (total.value + (double.parse(item.price) * item.units))
          .toPrecision(2);
    } else {
      total.value = (total.value +
              ((item.units - cartItem.units) * double.parse(item.price)))
          .toPrecision(2);
      cartItem.units = item.units;
    }
  }

  void updateItem(String id, int units) {
    if (cartItems[id] != null) {
      total.value = (total.value +
              ((units - cartItems[id]!.units) *
                  double.parse(cartItems[id]!.price)))
          .toPrecision(2);
      cartItems[id]!.units = units;
    }
  }

  void addUnit(String id, CartItemData? item) {
    if (cartItems[id] != null) {
      total.value = double.parse(cartItems[id]!.price).toPrecision(2);
      cartItems[id]!.units++;
    } else if (item != null) {
      cartItems[id] = item;
      total.value += double.parse(item.price).toPrecision(2);
    }
  }

  void reduceUnit(String id) {
    if (cartItems[id] != null) {
      total.value =
          (total.value - (double.parse(cartItems[id]!.price))).toPrecision(2);
      cartItems[id]!.units--;
    }
  }

  void removeItem(String id) {
    if (cartItems[id] != null) {
      total.value = (total.value -
              (double.parse(cartItems[id]!.price) * cartItems[id]!.units))
          .toPrecision(2);
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
