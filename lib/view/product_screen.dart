import 'package:basic_ui/view/cart_screen.dart';
import 'package:basic_ui/view/dashboard_screen.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final String image1;
  final String name1;
  final double price1;
  final String Description1;

  const ProductScreen({
    super.key,
    required this.image1,
    required this.name1,
    required this.price1,
    required this.Description1,
  });

  @override
  State<ProductScreen> createState() => _MyWidgetState();
}

final List<String> imageUrls = <String>[
  'https://t3.ftcdn.net/jpg/02/71/05/60/360_F_271056073_C0tbpNLFbcGurqxoMXqPBrx8vzL9VLVY.jpg',
  // Grey
  'https://image.made-in-china.com/2f0j00mOhVjWECLFpU/Nordic-Style-Modern-Upholstered-Shell-Velvet-Red-Armchair-Modern-Design-Living-Room-Sofa-Chair.webp',
  //red
  'https://www.massimogardone.it/www/wp-content/uploads/2020/07/Knit_513_01-768x1024.jpg',
  //black
];

int is_selected = 1;

class _MyWidgetState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 248, 255),
        body: Column(
          children: <Widget>[
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50)),
                    child: Image.network(
                      widget.image1,
                      height: size.height * 0.48,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  left: 5,
                  top: 7,
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DashboardScreen()),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 40,
                            )),
                        const Text(
                          'Products',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                                // left: 2.0,
                                right: 10.0,
                                top: 8.0,
                                child: Icon(
                                  Icons.circle,
                                  color: Color.fromARGB(255, 255, 117, 117),
                                  size: 12.0,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 35,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 50,
                      width: 50,
                      child: const ClipRRect(
                          child: Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 255, 117, 117),
                      ))),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.price1.toString(),
                    style: const TextStyle(
                      fontSize: 32,
                      color: Color.fromARGB(255, 255, 117, 117),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text(
                      widget.name1,
                      style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold
                          //  fontWeight: FontWeight.w900,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          ...List.generate(4, (index) {
                            return const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            );
                          }),
                          const Icon(
                            Icons.star_half,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '4.5',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ]),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Color option',
                    style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 92, 92, 92), fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            is_selected = 1;
                            widget.image1;
                          });
                        },
                        child: Icon(
                          is_selected == 1 ? Icons.radio_button_checked_outlined : Icons.circle,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            is_selected = 2;
                            widget.image1;
                          });
                        },
                        child: Icon(
                          is_selected == 2 ? Icons.radio_button_checked_outlined : Icons.circle,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            is_selected = 3;
                            widget.image1;
                          });
                        },
                        child: Icon(
                          is_selected == 3 ? Icons.radio_button_checked_outlined : Icons.circle,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 92, 92, 92),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.Description1,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CartScreen()),
                            );
                          },
                          child: Container(
                            height: 60,
                            width: 250,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 0, 30, 58),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
                            ),
                            child: const Center(
                                child: Text(
                              '+ Add to cart',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            )),
                          ),
                        ),
                      )
                    ],
                  )
                ])),
          ],
        ));
  }
}
