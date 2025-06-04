import 'package:basic_ui/Models/bestseller_item_dto.dart';
import 'package:basic_ui/Models/cart_item_dto.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final List<CartItemDto> items = [
    CartItemDto(
      name: 'Chair1',
      image: 'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
      price: 100,
      description: 'Description 1',
      isSelected: false,
      ischecked: false,
      quantity: 0,
    ),
    CartItemDto(
      name: 'Chair1',
      image: 'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
      price: 100,
      description: 'Description 1',
      isSelected: false,
      ischecked: false,
      quantity: 0,
    ),
    CartItemDto(
      name: 'Chair1',
      image: 'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
      price: 100,
      description: 'Description 1',
      isSelected: false,
      ischecked: false,
      quantity: 0,
    ),
    CartItemDto(
        name: 'Chair2',
        image: 'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
        price: 50,
        description: 'Description 1',
        isSelected: false,
        ischecked: false,
        quantity: 0),
    CartItemDto(
        name: 'Chair3',
        image: 'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
        price: 120,
        description: 'Description 1',
        isSelected: false,
        ischecked: false,
        quantity: 0),
    CartItemDto(
        name: 'Chair4',
        image: 'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
        price: 80,
        description: 'Description 1',
        isSelected: false,
        ischecked: false,
        quantity: 0),
  ];

  final List<BestsellerItemDto> productList = [
    BestsellerItemDto(
        name1: 'Minamal chair 1',
        image1: 'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
        price1: 345.0,
        Description1: 'Description1'),
    BestsellerItemDto(
      name1: 'Minamal chair 1',
      image1: 'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
      price1: 345.0,
      Description1: 'Description1',
    ),
    BestsellerItemDto(
      name1: 'Minamal chair 3',
      image1: 'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
      price1: 123.0,
      Description1: 'Description1',
    ),
  ];

  final List<BestsellerItemDto> prod = [
    BestsellerItemDto(
        name1: 'Minamal chair 1',
        image1: 'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
        price1: 345.0,
        Description1:
            'furniture, household equipment, usually made of wood, metal, plastics, marble, glass, fabrics, or related materials and having a variety of different purposes. Furniture ranges widely from the simple pine chest or stick-back'),
    BestsellerItemDto(
      name1: 'Minamal chair 2',
      image1: 'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
      price1: 657.0,
      Description1:
          'furniture, household equipment, usually made of wood, metal, plastics, marble, glass, fabrics, or related materials and having a variety of different purposes. Furniture ranges widely from the simple pine chest or stick-back',
    ),
    BestsellerItemDto(
      name1: 'Minamal chair 3',
      image1: 'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
      price1: 123.0,
      Description1:
          'furniture, household equipment, usually made of wood, metal, plastics, marble, glass, fabrics, or related materials and having a variety of different purposes. Furniture ranges widely from the simple pine chest or stick-back',
    ),
  ];
}
