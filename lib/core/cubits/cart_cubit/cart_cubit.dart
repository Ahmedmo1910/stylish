import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/entities/product_entity.dart';
import 'package:stylish/features/home/domain/entities/cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);

  void addToCart(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExits(productEntity);
    var cartItem = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      cartItem.increaseCount();
    } else {
      cartEntity.cartItems.add(cartItem);
    }

    emit(CartProductAdded());
  }
}
