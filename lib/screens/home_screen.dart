import 'package:coffy_application/consts.dart';
import 'package:coffy_application/screens/tabBarScreens/cappuccino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        backgroundColor: const Color(0xFFF6F6F6),
        body: SafeArea(
          child: ListView(
            children: [
              HeaderSection(size: size),
              SizedBox(height: size.height * 0.03),
              BannersSection(size: size),
              SizedBox(height: size.height * 0.03),
              Container(
                padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                ),
                color: const Color(0xFFF6F6F6),
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.white,
                  indicatorPadding:
                      EdgeInsets.symmetric(vertical: size.width * 0.015),
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
              ),
              SizedBox(height: size.width * 0.03),
              Container(
                height: size.height,
                width: size.width,
                padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                ),
                child: const TabBarView(
                  children: [
                    CappuccinoScreen(),
                    Center(child: Text("Page 2")),
                    Center(child: Text("Page 3")),
                    Center(child: Text("Page 4")),
                    Center(child: Text("Page 5")),
                    Center(child: Text("Page 6")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Start HeaderSection
class HeaderSection extends StatefulWidget {
  const HeaderSection({Key? key, required Size size}) : super(key: key);

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  String firstName = '';
  String lastName = '';
  String addressOne = '';
  String addressTwo = '';

  getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    firstName = prefs.getString("firstName")!;
    lastName = prefs.getString("lastName")!;
    addressOne = prefs.getString("addressOne")!;
    addressTwo = prefs.getString("addressTwo")!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      padding: EdgeInsets.only(
        left: size.width * 0.05,
        right: size.width * 0.05,
        // top: size.width * 0.05,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Deliver To $addressOne",
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Row(
                      children: [
                        Text("$firstName $lastName",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: size.width * 0.15,
                height: size.width * 0.15,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(size.width * 0.5)),
                  image: const DecorationImage(
                      image: AssetImage("images/userImage.jpg"),
                      fit: BoxFit.fill),
                ),
              )
            ],
          ),
          SizedBox(height: size.width * 0.03),
          Container(
            width: size.width,
            height: size.height * 0.05,
            decoration: BoxDecoration(
                color: const Color(0xFF313131),
                borderRadius:
                    BorderRadius.all(Radius.circular(size.width * 0.03))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: size.width * 0.05),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: size.width * 0.02),
                      const Text(
                        "Search Coffee",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.08,
                  height: size.width * 0.08,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(size.width * 0.5)),
                      color: mainColor),
                  child: const Icon(
                    Icons.restaurant_menu_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
//End HeaderSection

//Start BannerSection
class BannersSection extends StatelessWidget {
  const BannersSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.9,
      padding: EdgeInsets.only(top: size.width * 0.05, left: size.width * 0.05),
      margin:
          EdgeInsets.only(right: size.width * 0.05, left: size.width * 0.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size.width * 0.05)),
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
                horizontal: size.width * 0.03, vertical: size.width * 0.01),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.all(Radius.circular(size.width * 0.02))),
            child: const Text(
              "Promo",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Text(
            "Buy one get \n one Free",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
//End BannerSection
