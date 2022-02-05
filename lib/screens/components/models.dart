class CartItemData {
  CartItemData({
    this.price = 0,
    this.name = 'Cart Item',
    this.quantity = '-- unit',
    this.img,
    this.units = 1,
  });

  final double price;
  final String name;
  final String? img;
  final String quantity;
  int units;
}
