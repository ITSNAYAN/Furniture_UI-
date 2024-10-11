import 'package:basic_ui/Models/bestseller_item_dto.dart';
import 'package:basic_ui/Models/cart_item_dto.dart';
import 'package:basic_ui/cart.dart';
import 'package:basic_ui/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basic_ui/page2_product.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void addtocart(CartItemDto item) {
    item.quantity = 1;
    cartItemsGlobel.add(CartItemDto(
        name: item.name,
        image: item.image,
        price: item.price,
        description: item.description,
        isSelected: item.isSelected,
        ischecked: item.ischecked,
        quantity: item.quantity));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 248, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 231, 248, 255),
          leading: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10.0),
            // Adjust top padding
            child: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 35,
                  ), onPressed: () { 
                    Scaffold.of(context).openDrawer();
                   },
                );
              }
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 25.0, right: 20.0), // Adjust top padding
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                    child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 22,
                )),
              ),
            )
          ],
        ),
      ),
    drawer: Drawer(
      backgroundColor: Colors.black,
      child: Container(
         child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.grey
              ),
             width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.25,
              child: const Row(
                children: [
                  // profileimage 
                ],
              ),
            )
          ],
         ),
      ),
    ),







      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Card(
                      elevation: 8.0,
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 12),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              //labelText: 'search',
                              hintText: 'Search',
                              labelStyle:
                                  TextStyle(fontSize: 20, color: Colors.grey)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, top: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Cart(),
                                )).whenComplete(() {
                              setState(() {});
                            });
                          },
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            size: 35,
                          ),
                        ),
                      ),
                      const Positioned(
                          // left: 2.0,
                          right: 10.0,
                          top: 8.0,
                          child: Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 12.0,
                          ))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore',
                      style: GoogleFonts.inter(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 310,
                child: ListView.separated(
                  //  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 190,
                      child: Card(
                          elevation: 5.0,
                          margin: const EdgeInsets.only(bottom: 12),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: InkWell(
                                        onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => product(
                                      image1: items[index].image, name1: items[index].name,price1: items[index].price, Description1: items[index].description,
                                     
                                  )),
                            );
                          },
                                        child: Image.network(
                                          items[index].image,
                                          height: 170,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 18,
                                    top: 18,
                                    child: InkWell(
                                      onTap: () {
                                        items[index].isSelected =
                                            !items[index].isSelected;

                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromARGB(
                                                255, 255, 117, 117)),
                                        child: Icon(
                                          Icons.favorite,
                                          color: items[index].isSelected
                                              ? Colors.red.shade900
                                              : Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 107.0, top: 1),
                                child: Text(
                                  items[index].name,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      right: 95, bottom: 1),
                                  child: Text(
                                    items[index].description,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${items[index].price}",
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 18),
                                    ),
                                    items[index].quantity == 0
                                        ? InkWell(
                                            onTap: () {
                                              addtocart(items[index]);
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 28,
                                              width: 28,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black),
                                              child: const Icon(
                                                Icons.add,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        : const Icon(Icons.check)
                                  ],
                                ),
                              )
                            ],
                          )),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 160),
                child: Text(
                  'Best Selling',
                  style: GoogleFonts.inter(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),

              Card(
                elevation: 5.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Minimal Chair1',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Description1',
                            style: TextStyle(fontSize: 14, color: Colors.grey
                                //  fontWeight: FontWeight.w900,

                                ),
                          ),
                          Text(
                            '\$345.0',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, right: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => product(
                                      image1: prod[0].image1, name1: prod[0].name1,price1: prod[0].price1, Description1: prod[0].Description1,
                                     
                                  )),
                            );
                          },
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              child: const Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 5.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://thearchitectsdiary.com/wp-content/uploads/2023/03/Space-Plus-20230311T102912Z-00113-March-Space-Plus1.-Photosresized-10.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Minimal Chair2',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Description2',
                            style: TextStyle(fontSize: 14, color: Colors.grey
                                //  fontWeight: FontWeight.w900,

                                ),
                          ),
                          Text(
                            '\$657.0',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, right: 10),
                        child: InkWell(
                          onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  product(
                                      image1 : prod[1].image1,
                                      name1: prod[1].name1,
                                       Description1: prod[1].Description1,
                                      price1: prod[1].price1,
                                  )),
                            );
                          },
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              child: const Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 5.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://www.worm.co.uk/cdn/shop/products/vincent-sheppard-frida-lounge-chair_480x.jpg?v=1677710229',
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Minimal Chair 3',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Description 3',
                            style: TextStyle(fontSize: 14, color: Colors.grey
                                //  fontWeight: FontWeight.w900,

                                ),
                          ),
                          Text(
                            '\$123.0',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, right: 10),
                        child: InkWell(
                          onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  product(image1: prod[2].image1, name1:prod[2].name1, price1:prod[2].price1 , Description1: prod[2 ].Description1,
                                  )),
                            );
                          },
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              child: const Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
             ],
          ),
        ),
      ),
    );
  }
}

final List<CartItemDto> items = [
  CartItemDto(
    name: 'Chair1',
    image:
        'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
    price: 100,
    description: 'Description 1',
    isSelected: false,
    ischecked: false,
    quantity: 0,
  ),
  CartItemDto(
      name: 'Chair2',
      image:
          'https://www.massimogardone.it/www/wp-content/uploads/2020/07/Knit_513_01-768x1024.jpg',
      price: 50,
      description: 'Description 1',
      isSelected: false,
      ischecked: false,
      quantity: 0),
  CartItemDto(
      name: 'Chair3',
      image:
          'https://www.massimogardone.it/www/wp-content/uploads/2017/10/Cover_Ethimo_Esedra_05-768x1024.jpg',
      price: 120,
      description: 'Description 1',
      isSelected: false,
      ischecked: false,
      quantity: 0),
  CartItemDto(
      name: 'Chair4',
      image:
          'https://www.massimogardone.it/www/wp-content/uploads/2017/10/EthimoSwing_01-768x1024.jpg',
      price: 80,
      description: 'Description 1',
      isSelected: false,
      ischecked: false,
      quantity: 0),
];




final List<BestsellerItemDto> prod = [
  BestsellerItemDto(
    name1: 'Minamal chair 1',
    image1:
         'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
    price1: 345.0,
    Description1: 'furniture, household equipment, usually made of wood, metal, plastics, marble, glass, fabrics, or related materials and having a variety of different purposes. Furniture ranges widely from the simple pine chest or stick-back'
    
  ),
  BestsellerItemDto(
      name1: 'Minamal chair 2',
      image1:
      'https://thearchitectsdiary.com/wp-content/uploads/2023/03/Space-Plus-20230311T102912Z-00113-March-Space-Plus1.-Photosresized-10.jpg',
      price1: 657.0,
      Description1: 'furniture, household equipment, usually made of wood, metal, plastics, marble, glass, fabrics, or related materials and having a variety of different purposes. Furniture ranges widely from the simple pine chest or stick-back',    
),
  BestsellerItemDto(
      name1: 'Minamal chair 3',
      image1:
        'https://www.worm.co.uk/cdn/shop/products/vincent-sheppard-frida-lounge-chair_480x.jpg?v=1677710229',
      price1:123.0,
      Description1: 'furniture, household equipment, usually made of wood, metal, plastics, marble, glass, fabrics, or related materials and having a variety of different purposes. Furniture ranges widely from the simple pine chest or stick-back',
      ),
 
];


// final List<BestsellerItemDto> Products = [
//   BestsellerItemDto(
//       image:
//           'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
//       name: 'Minimal chair 1 ',
//       Description: 'Description 1',
//       price: 80),
//   BestsellerItemDto(
//       image:
//           'https://thearchitectsdiary.com/wp-content/uploads/2023/03/Space-Plus-20230311T102912Z-00113-March-Space-Plus1.-Photosresized-10.jpg',
//       name: 'Minimal chair 2',
//       Description: 'Description 2',
//       price: 100),
//   BestsellerItemDto(
//       image:
//           'https://www.worm.co.uk/cdn/shop/products/vincent-sheppard-frida-lounge-chair_480x.jpg?v=1677710229',
//       name: 'Minimal chair 3',
//       Description: 'Description 3',
//       price: 220),
// ];
