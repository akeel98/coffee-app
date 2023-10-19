import 'package:coffy_application/consts.dart';
import 'package:flutter/material.dart';

import '../detailScreen.dart';

class CappuccinoScreen extends StatefulWidget {
  const CappuccinoScreen({Key? key}) : super(key: key);

  @override
  State<CappuccinoScreen> createState() => _CappuccinoScreenState();
}

class _CappuccinoScreenState extends State<CappuccinoScreen> {
  List<String> cappuccinoImages = [
    "images/cappuccino/cap-01.jpg",
    "images/cappuccino/cap-02.jpg",
    "images/cappuccino/cap-03.jpeg",
    "images/cappuccino/cap-04.jpeg",
    "images/cappuccino/cap-05.jpeg",
    "images/cappuccino/cap-06.jpeg",
    "images/cappuccino/cap-07.jpg",
    "images/cappuccino/cap-08.jpg",
    "images/cappuccino/cap-09.jpg",
    "images/cappuccino/cap-10.jpg",
    "images/cappuccino/cap-11.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: GridView.builder(
        shrinkWrap: true,

        //TODO::There is a problem of scrolling here ...
        physics:const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: size.height * 0.32,
            crossAxisSpacing: size.width *0.03,
            mainAxisSpacing: size.width *0.03
        ),
        itemCount: cappuccinoImages.length,
        itemBuilder: (BuildContext context, int i) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  DetailsScreen(img: cappuccinoImages[i] )));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(size.width * 0.06)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.2,
                    padding: EdgeInsets.only(
                      left: size.width * 0.03,
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(size.width * 0.06)),
                        image: DecorationImage(
                          image: AssetImage(cappuccinoImages[i]),
                          fit: BoxFit.cover,
                        )),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        Text(
                          "4.8",
                          style: TextStyle(fontSize: size.width * 0.04, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cappuccino',
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.width * 0.01),
                        Text(
                          'With Chocolate',
                          style: TextStyle(
                            fontSize: size.width * 0.035,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: size.width * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ 4.53',
                              style: TextStyle(
                                fontSize: size.width * 0.05,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.all(size.width * 0.01),
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(size.width * 0.02))),
                                child: const Icon(Icons.add, color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
