class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);
}

class ShoppingCart {
  List<Product> _items = [];

  void addItem(Product item) {
    _items.add(item);
  }

  void removeItem(Product item) {
    _items.remove(item);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in _items) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }
  void applyDiscounts(Map<String, double> discounts) {
    for (var item in _items) {
      if (discounts.containsKey(item.name)) {
        double discount = discounts[item.name]!;
        item.price -= discount;
      }
    }
  }
}

void main() {

  Product laptop = Product('Laptop', 1000.0, 1);
  Product shirt = Product('Shirt', 30.0, 2);
  Product phone = Product('Phone', 500.0, 1);

  ShoppingCart cart = ShoppingCart();

  cart.addItem(laptop);
  cart.addItem(shirt);
  cart.addItem(phone);
  
  double totalPriceBeforeDiscounts = cart.calculateTotalPrice();
  print('Total price before discounts: \$${totalPriceBeforeDiscounts.toStringAsFixed(2)}');

  Map<String, double> discounts = {'Shirt': 5.0, 'Phone': 50.0};
  cart.applyDiscounts(discounts);

  double totalPriceAfterDiscounts = cart.calculateTotalPrice();
  print('Total price after discounts: \$${totalPriceAfterDiscounts.toStringAsFixed(2)}');
}
