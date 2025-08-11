class BottomNavigationBarEntity {
  final String activeImage, inactiveImage;
  final String name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inactiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItem => [
      BottomNavigationBarEntity(
        activeImage: 'assets/icons/home.svg',
        inactiveImage: 'assets/icons/home.svg',
        name: 'Home',
      ),
      BottomNavigationBarEntity(
        activeImage: 'assets/icons/heart.svg',
        inactiveImage: 'assets/icons/heart.svg',
        name: 'Wishlist',
      ),
      BottomNavigationBarEntity(
        activeImage: 'assets/icons/cart.svg',
        inactiveImage: 'assets/icons/cart.svg',
        name: 'Cart',
      ),
      BottomNavigationBarEntity(
        activeImage: 'assets/icons/search.svg',
        inactiveImage: 'assets/icons/search.svg',
        name: 'Search',
      ),
      BottomNavigationBarEntity(
        activeImage: 'assets/icons/settings.svg',
        inactiveImage: 'assets/icons/settings.svg',
        name: 'Settings',
      ),
    ];
