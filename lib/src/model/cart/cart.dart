import '../product/product_detail.dart';
import 'package:intl/intl.dart';

class CartItem {
  CartItem(this.itemId, this.quantity);

  final String itemId;
  int quantity;

  String? getItemId() => productList.firstWhere((e) => e.id == itemId).id;
  String? getItemName() => productList.firstWhere((e) => e.id == itemId).name;
  int getItemPrice() =>
      productList.firstWhere((e) => e.id == itemId).priceToInt() ?? 0;
  String? getItemPriceString() =>
      productList.firstWhere((e) => e.id == itemId).price;
}

List<CartItem> cartItemsList = [];

NumberFormat f = NumberFormat('###,###', 'en_US');

String calcTotalPrice(List<CartItem> cartList) {
  int price = 0;
  for (final element in cartList) {
    price += element.getItemPrice() * element.quantity;
  }

  return f.format(price);
}

String calcTotalPriceAndNormalShipping(List<CartItem> cartList) {
  int price = 0;
  for (final element in cartList) {
    price += element.getItemPrice() * element.quantity;
  }
  price += 20000;

  return f.format(price);
}

String calcTotalPriceAndTimedShipping(List<CartItem> cartList) {
  int price = 0;
  for (final element in cartList) {
    price += element.getItemPrice() * element.quantity;
  }
  price += 40000;

  return f.format(price);
}

String name = 'Lê Hiếu';
String phoneNumber = '(+84) 933177122';
String address = '227 Nguyễn Văn Cừ, phường 8, quận 5, Hồ Chí Minh';
