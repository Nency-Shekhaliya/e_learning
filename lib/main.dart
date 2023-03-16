import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_learning/views/screens/bookmark.dart';
import 'package:e_learning/views/screens/web_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "E-learning ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Bookmark_page()));
                  },
                  icon: const Icon(Icons.bookmark_add)),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                CarouselSlider(
                  items: [
                    Mybox(
                        pic:
                            "https://i.insider.com/5fbd515550e71a001155724f?width=700"),
                    Mybox(
                        pic:
                            "https://i0.wp.com/www.rushinformation.com/wp-content/uploads/2014/07/W3Schools.jpg?fit=300%2C225&resize=1280%2C720"),
                    Mybox(
                        pic:
                            "https://training.javatpoint.com/cmn/front/assets/jtp_a.jpg"),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    animateToClosest: true,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  height: 30,
                  child: const Text(
                    "Apps",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    Mybox2(
                        path: "https://www.wikipedia.org/",
                        pic2:
                            'https://i.insider.com/5fbd515550e71a001155724f?width=700https://i.insider.com/5fbd515550e71a001155724f?width=700'),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Wikipedia",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                Row(
                  children: [
                    Mybox2(
                        path: 'https://www.w3schools.com/',
                        pic2:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo4lXvBOgdoKLXgRbAtlNZcW3_kFXTCXToW_wzEnhX5Oh5VnL4G3eNq2bnQTLM_I2OWpE&usqp=CAU'),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "W3School",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                Row(
                  children: [
                    Mybox2(
                        path: "https://www.javatpoint.com/",
                        pic2:
                            'https://media.licdn.com/dms/image/C4D0BAQEwg5FK93uumQ/company-logo_200_200/0/1519923012279?e=2147483647&v=beta&t=63CNoS8OTR4lHjPhHSO7eFFqwLGwYunWfyDBV3tdc0c'),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Java point",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Mybox({required String pic}) => Container(
        margin: const EdgeInsets.only(left: 10),
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: NetworkImage(pic), fit: BoxFit.cover),
          border: Border.all(color: Colors.black, width: 1),
          color: Colors.pink,
        ),
      );
  Mybox2({required String path, required String pic2}) =>
      Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Web_page(link: path)));
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 2),
              image:
                  DecorationImage(image: NetworkImage(pic2), fit: BoxFit.cover),
            ),
          ),
        );
      });
}
