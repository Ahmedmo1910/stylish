import 'package:stylish/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Black T-Shirt',
    description: 'A stylish black t-shirt made from 100% cotton.',
    price: 19.99,
    imageUrl: '',
    category: 'Apparel',
    code: 'BT001',
    reviews: [],
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
