class Product {
  const Product({
    this.name,
    this.price,
    this.imagePath,
    this.description,
  });

  int? priceToInt() {
    return price?.replaceAll('.', '').replaceAll('đ', '') as int?;
  }

  final String? name;
  final String? price;
  final String? imagePath;
  final String? description;
}

final productList = [
  const Product(
    name: 'Gấu bông',
    price: '220.000đ',
    imagePath: 'teddy',
    description: '',
  ),
  const Product(
    name: 'Thỏ trắng',
    price: '150.000đ',
    imagePath: 'rabbit',
    description: '',
  ),
  const Product(
    name: 'Minion',
    price: '220.000đ',
    imagePath: 'minion',
    description: '',
  ),
  const Product(
    name: 'Ngựa cưỡi',
    price: '150.000đ',
    imagePath: 'horse',
    description: '',
  ),
  const Product(
    name: 'Rô bốt',
    price: '220.000đ',
    imagePath: 'robot',
    description: '',
  ),
  const Product(
    name: 'Xe 4 bánh',
    price: '150.000đ',
    imagePath: 'bike',
    description: '',
  ),
];
