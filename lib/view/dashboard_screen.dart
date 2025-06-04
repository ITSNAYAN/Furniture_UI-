import 'package:basic_ui/Models/bestseller_item_dto.dart';
import 'package:basic_ui/Models/cart_item_dto.dart';
import 'package:basic_ui/controller/dashboardController.dart';
import 'package:basic_ui/controller/globals.dart';
import 'package:basic_ui/view/cart_screen.dart';
import 'package:basic_ui/view/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _HomepageState();
}

class _HomepageState extends State<DashboardScreen> {
  void addToCart(CartItemDto item) {
    item.quantity = 1;
    cartItem.add(CartItemDto(
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
    final DashboardController _controller = Get.put(DashboardController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 248, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 231, 248, 255),
          leading: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10.0),
            // Adjust top padding
            child: Builder(builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 35,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, right: 20.0), // Adjust top padding
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
        backgroundColor: const Color.fromARGB(255, 231, 248, 255),
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.grey),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ],
                    )
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Card(
                      elevation: 8.0,
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                              labelStyle: TextStyle(fontSize: 20, color: Colors.grey)),
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
                                  builder: (context) => const CartScreen(),
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
                  itemCount: _controller.items.length,
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
                                                builder: (context) => ProductScreen(
                                                      image1: _controller.prod[index].image1,
                                                      name1: _controller.prod[index].name1,
                                                      price1: _controller.prod[index].price1,
                                                       Description1: _controller.prod[index].Description1,
                                                    )),
                                          );
                                        },
                                        child: Image.network(
                                          _controller.items[index].image,
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
                                        _controller.items[index].isSelected = !_controller.items[index].isSelected;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 255, 117, 117)),
                                        child: Icon(
                                          Icons.favorite,
                                          color: _controller.items[index].isSelected ? Colors.red.shade900 : Colors.white,
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
                                padding: const EdgeInsets.only(right: 107.0, top: 1),
                                child: Text(
                                  _controller.items[index].name,
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(right: 95, bottom: 1),
                                  child: Text(
                                    _controller.items[index].description,
                                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${_controller.items[index].price}",
                                      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                                    ),
                                    _controller.items[index].quantity == 0
                                        ? InkWell(
                                            onTap: () {
                                              addToCart(_controller.items[index]);
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 28,
                                              width: 28,
                                              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
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
              Text(
                'Best Selling',
                style: GoogleFonts.inter(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _controller.productList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              _controller.productList[index].image1,
                              height: 100,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _controller.productList[index].name1,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                _controller.productList[index].Description1,
                                style: const TextStyle(fontSize: 14, color: Colors.grey
                                    //  fontWeight: FontWeight.w900,

                                    ),
                              ),
                              Text(
                                "\$${_controller.productList[index].price1}",
                                style: const TextStyle(
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
                                      builder: (context) => ProductScreen(
                                            image1: _controller.prod[0].image1,
                                            name1: _controller.prod[0].name1,
                                            price1: _controller.prod[0].price1,
                                             Description1: _controller.prod[0].Description1,
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
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
