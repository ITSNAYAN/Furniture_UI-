import 'package:basic_ui/controller/dashboardController.dart';
import 'package:basic_ui/controller/globals.dart';
import 'package:basic_ui/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartState();
}
int totalQuantity = 0;
double totalPrice = 0.0;

bool ischange_color = false;

class _CartState extends State<CartScreen> {
  final DashboardController _itemController = Get.put(DashboardController());

  void incrementQuantity(int index) {
    cartItem[index].quantity++;
    totalCalculate();
    setState(() {});
  }

  void decrementQuantity(int index) {
    if (cartItem[index].quantity > 1) {
      cartItem[index].quantity--;
      setState(() {});
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('want to remove this from cart?'),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      //    items.removeWhere((test) => test.name == cartItem[index].name);
                      cartItem.removeAt(index);
                      // cartItemsGlobel [index].ischecked = false;
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'))
              ],
            );
          }).then((v) {
        setState(() {});
      });
    }
    totalCalculate();
  }

  void totalCalculate() {
    totalQuantity = 0;
    totalPrice = 0.0;
    for (var item in cartItem) {
      if (item.ischecked) {
        totalQuantity += item.quantity;
        totalPrice = totalQuantity * item.price;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 248, 255),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                  ),
                  const Text(
                    'Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0, top: 8.0),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 35,
                        ),
                      ),
                      Positioned(
                        right: 10.0,
                        top: 8.0,
                        child: Icon(
                          Icons.circle,
                          color: Color.fromARGB(255, 255, 117, 117),
                          size: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: cartItem.isEmpty
                  ? const Center(
                      child: Text(
                        "Cart is Empty",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.separated(
                      itemCount: cartItem.length,
                      separatorBuilder: (context, index) => const Divider(
                            thickness: 0,
                          ),
                      itemBuilder: (context, index) {
                        final item = cartItem[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: [
                              Checkbox(
                                value: item.ischecked,
                                activeColor: item.ischecked ? Colors.red : Colors.blue,
                                onChanged: (bool? value) {
                                  item.ischecked = value ?? false;
                                  totalCalculate();
                                  setState(() {});
                                },
                              ),
                              const SizedBox(width: 5),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  item.image,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$${item.price}",
                                        style: TextStyle(color: Colors.red[400], fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 131, 193, 243),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () => incrementQuantity(index),
                                                icon: const Icon(
                                                  Icons.add,
                                                  size: 20,
                                                  color: Color.fromARGB(255, 0, 0, 0),
                                                ),
                                              ),
                                              Text(
                                                item.quantity.toString(),
                                                style: const TextStyle(fontSize: 20),
                                              ),
                                              IconButton(
                                                onPressed: () => decrementQuantity(index),
                                                icon: const Icon(
                                                  Icons.remove,
                                                  size: 20,
                                                  color: Color.fromARGB(255, 0, 0, 0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
            ),
            Container(
              height: 280,
              width: double.infinity,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0),
                      blurRadius: 3.0,
                    ),
                  ],
                  color: Color.fromARGB(255, 231, 248, 255),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total items',
                          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 97, 97, 97), fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${totalQuantity.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.red[300],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 97, 97, 97), fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.red[300],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Shipping fee',
                          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 97, 97, 97), fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$50',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red[300],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'SubTotal',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${(totalPrice + 50).toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.red[400],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      // color: Colors.blue,
                      decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 0, 0), borderRadius: BorderRadius.circular(30)),
                      height: 50,
                      width: double.infinity,
                      child: const Center(
                          child: Text(
                        'Checkout',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
