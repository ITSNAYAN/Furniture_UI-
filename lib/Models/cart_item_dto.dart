class CartItemDto {
  String name;
  String image;
  double price;
  String description;
  bool isSelected;
  bool ischecked;
  int quantity;

  CartItemDto({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.isSelected,
    required this.ischecked,
    required this.quantity,
  });
}
