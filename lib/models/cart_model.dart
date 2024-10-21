class CartItem {
  final String name;
  final String price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  double getTotalPrice() {
    return int.parse(price.replaceAll(RegExp(r'\D'), '')).toDouble() * quantity;
  }
}