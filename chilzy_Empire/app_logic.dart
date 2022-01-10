import 'dart:io';

class Chilzy {
  String? _product_name;
  int? _quantity_of_product;
  double? _product_price;

  Chilzy(String _product_name, int _quantity_of_product, double _product_price) {
    this._product_name = _product_name;
    this._quantity_of_product = _quantity_of_product;
    this._product_price = _product_price;
  }

  String add_product() {
    return _product_name!;
  }

  int add_product_quantity() {
    return _quantity_of_product!;
  }

  double add_product_price() {
    return _product_price!;
  }

  List add_data() {
    String product = add_product();
    List add_data = ["Trophy", "Star", "Goldberg"];
    add_data.add(product);
    return add_data;
  }

  List price_data() {
    double price = add_product_price();
    List price_data = [2900, 2900, 3000];
    price_data.add(price);
    return price_data;
  }

  List quantity_data() {
    int quantity = add_product_quantity();
    List quantity_data = [20, 30, 21];
    quantity_data.add(quantity);
    return quantity_data;
  }

  void display_board() {
    List display_name = add_data();
    List display_quantity = quantity_data();
    List display_price = price_data();
    print("""
        Product Name       Avaliable Crates   Price of crate   Prdoucts profit
    """);
    for (int i = 0; i < display_name.length; i++) {
      print("""
        ${display_name[i]}         \t${display_price[i]} \t\t${display_quantity[i]}
    """);
    }
  }
}

String message(String message) {
  print(message);
  String response = stdin.readLineSync()!;
  return response;
}

int quan_message(String message) {
  print(message);
  int response = int.parse(stdin.readLineSync()!);
  return response;
}

double price_message(String message) {
  print(message);
  double response = double.parse(stdin.readLineSync()!);
  return response;
}

void main() {
  List products = [];
  List quantities = [];
  List prices = [];
  for (int i = 0; i < 3; i++) {
    String product = message("Enter Product: ");
    int quantity = quan_message("Enter number of crates: ");
    double price = price_message("Enter Price: ");
    products.add(product);
    quantities.add(quantity);
    prices.add(price);
    Chilzy chilzy_empire = Chilzy(products[i], quantities[i], prices[i]);
    print(i);
    if (i == 2) {
      chilzy_empire.display_board();
    }
  }
}
