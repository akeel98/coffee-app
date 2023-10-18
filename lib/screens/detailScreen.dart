import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../consts.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.img,
  }) : super(key: key);

  final String img;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool small = false;
  bool middle = true;
  bool large = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text("Detail"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.03),
            child: Icon(Icons.favorite_border, size: size.width * 0.08),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: size.width,
                  height: size.height * 0.3,
                  margin: EdgeInsets.only(bottom: size.width * 0.03),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(size.width * 0.05),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.img),
                        fit: BoxFit.cover,
                      ))),
              Text(
                "Cappucino",
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "With Chocolate",
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
              ),
              Container(
                padding: EdgeInsets.only(bottom: size.width * 0.03),
                margin: EdgeInsets.only(
                    top: size.width * 0.05, bottom: size.width * 0.05),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        Text(
                          "4.8",
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "(230)",
                          style: TextStyle(
                              fontSize: size.width * 0.04,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.1,
                          height: size.width * 0.1,
                          margin: EdgeInsets.only(right: size.width * 0.03),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(size.width * 0.03)),
                            color: const Color(0xFFF9F9F9),
                          ),
                          child: Icon(Icons.coffee, color: mainColor),
                        ),
                        Container(
                          width: size.width * 0.1,
                          height: size.width * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(size.width * 0.03)),
                            color: const Color(0xFFF9F9F9),
                          ),
                          child: Icon(
                            Icons.coffee_maker_outlined,
                            color: mainColor,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ReadMoreText(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla',
                trimLines: 3,
                style: const TextStyle(color: Colors.grey),
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more',
                trimExpandedText: '...Show less',
                lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: mainColor),
                moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: mainColor),
              ),
              SizedBox(height: size.width * 0.05),
              Text(
                "Size",
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.width * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  sizeOption(
                    size: size,
                    text: "S",
                    choosed: small,
                    onTap: () {
                      setState(() {
                        small = true;
                        middle = false;
                        large = false;
                      });
                    },
                  ),
                  sizeOption(
                    size: size,
                    text: "M",
                    choosed: middle,
                    onTap: () {
                      setState(() {
                        small = false;
                        middle = true;
                        large = false;
                      });
                    },
                  ),
                  sizeOption(
                    size: size,
                    text: "L",
                    choosed: large,
                    onTap: () {
                      setState(() {
                        small = false;
                        middle = false;
                        large = true;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: size.width * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                            color: Colors.grey, fontSize: size.width * 0.05),
                      ),
                      Text(
                        "\$ 4.53",
                        style: TextStyle(
                            fontSize: size.width * 0.07,
                            color: mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.07,
                        vertical: size.width * 0.03),
                    color: mainColor,
                    minWidth: size.width / 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(size.width * 0.05))),
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.05),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell sizeOption(
      {required Size size,
      required String text,
      required bool choosed,
      required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width / 4,
        height: size.height * 0.06,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(size.width * 0.02)),
            border: Border.all(
                color: choosed == true ? const Color(0xFFE4C4AF) : Colors.grey,
                width: choosed == true ? 3 : 1),
            color: choosed == true ? const Color(0xFFFAF0E9) : Colors.transparent),
        child: Text(
          text,
          style: TextStyle(
              fontSize: size.width * 0.05,
              color: choosed == true ? mainColor : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
