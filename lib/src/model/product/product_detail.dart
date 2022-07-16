class Product {
  const Product({
    this.name,
    this.price,
    this.id,
    this.description,
  });

  int? priceToInt() {
    return int.parse(
      price?.replaceAll(',', '').replaceAll('đ', '').replaceAll(' ', '') ?? '',
    );
  }

  final String? name;
  final String? price;
  final String? id;
  final String? description;
}

const teddy = Product(
  name: 'Gấu bông',
  price: '220,000 đ',
  id: 'teddy',
  description: '',
);

final productList = [
  const Product(
    name: 'Gấu bông',
    price: '220,000 đ',
    id: 'teddy',
    description: '',
  ),
  const Product(
    name: 'Thỏ trắng',
    price: '150,000 đ',
    id: 'rabbit',
    description: '',
  ),
  const Product(
    name: 'Minion',
    price: '220,000 đ',
    id: 'minion',
    description: '',
  ),
  const Product(
    name: 'Ngựa cưỡi',
    price: '150,000 đ',
    id: 'horse',
    description: '',
  ),
  const Product(
    name: 'Rô bốt',
    price: '220,000 đ',
    id: 'robot',
    description: '',
  ),
  const Product(
    name: 'Xe 4 bánh',
    price: '150,000 đ',
    id: 'bike',
    description: '',
  ),
];
