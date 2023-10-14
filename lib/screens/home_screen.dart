import 'package:coffy_application/consts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: size.height,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    height: size.height * 0.4,
                    padding: EdgeInsets.only(
                      left: size.width * 0.05,
                      right: size.width * 0.05,
                      top: size.width * 0.1,
                    ),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [Color(0xFF292929), Color(0xFF1E1E1E)],
                      begin: Alignment.centerLeft,
                      end: Alignment.topRight,
                    )),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Location",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "UserName Will Be Here",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(Icons.keyboard_arrow_down)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: size.width * 0.18,
                              height: size.width * 0.18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(size.width * 0.05)),
                                  image: const DecorationImage(
                                      image: AssetImage("images/userImage.jpg"),
                                      fit: BoxFit.fill)),
                            )
                          ],
                        ),
                        SizedBox(height: size.width * 0.09),
                        Container(
                          width: size.width,
                          height: size.height * 0.08,
                          decoration: BoxDecoration(
                              color: const Color(0xFF313131),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.05))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.only(left: size.width * 0.08),
                                child: Row(
                                  children: [
                                    const Icon(Icons.search),
                                    SizedBox(width: size.width * 0.02),
                                    const Text(
                                      "Search Coffee",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(size.width * 0.05),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(size.width * 0.05)),
                                    color: mainColor),
                                child:
                                    const Icon(Icons.restaurant_menu_outlined),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: size.height * 0.4,
                  child: Container(
                    height: size.height * 0.6,
                    padding: EdgeInsets.only(
                      left: size.width * 0.05,
                      right: size.width * 0.05,
                      top: size.width * 0.24,
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        TabBar(
                          tabAlignment: TabAlignment.start,
                          dividerColor: Colors.transparent,
                          unselectedLabelColor: Colors.black,
                          labelColor: Colors.white,
                          indicatorPadding: EdgeInsets.symmetric(
                              vertical: size.width * 0.015),
                          indicator: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.015))),
                          indicatorColor: Colors.transparent,
                          isScrollable: true,
                          tabs: [
                            Tab(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.025),
                                child: const Text(
                                  'Cappuccino',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.025),
                                child: const Text(
                                  'Espresso',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.025),
                                child: const Text(
                                  'Latte',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.025),
                                child: const Text(
                                  'Americano',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.025),
                                child: const Text(
                                  'Caffè mocha',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.025),
                                child: const Text(
                                  'Flat white',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            child: const TabBarView(
                              children: [
                                Center(child: Text("Page 1")),
                                Center(child: Text("Page 2")),
                                Center(child: Text("Page 3")),
                                Center(child: Text("Page 4")),
                                Center(child: Text("Page 5")),
                                Center(child: Text("Page 6")),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  top: size.height * 0.3,
                  child: Container(
                    height: size.height * 0.2,
                    width: size.width,
                    padding: EdgeInsets.only(
                        top: size.width * 0.05, left: size.width * 0.05),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(size.width * 0.05)),
                        image: const DecorationImage(
                          image: AssetImage('images/coffee.png'),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: size.width * 0.01),
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.width * 0.01),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.02))),
                          child: const Text("Promo"),
                        ),
                        const Text(
                          "Buy one get \n one Free",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.black,
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
      ),
    );
  }
}
