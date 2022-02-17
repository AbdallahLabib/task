import 'package:flap_kap/UI/web/graph_screen_web.dart';
import 'package:flap_kap/model/card_model.dart';
import 'package:flap_kap/provider/order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NumericMetricsWeb extends StatefulWidget {
  const NumericMetricsWeb({Key? key}) : super(key: key);

  @override
  State<NumericMetricsWeb> createState() => _NumericMetricsWebState();
}

class _NumericMetricsWebState extends State<NumericMetricsWeb> {
  late PageController _pageController;
  int _currentPage = 0;

  late Size size;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, viewportFraction: 0.5);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FC),
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 70,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: const [
              Text(
                'Flap',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              Text(
                'Kap',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 50,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: const Color(0xffF4F7FC),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ///process overview
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Process overview',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 3),
                        ]),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            '2021',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(CupertinoIcons.chevron_down)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Row(
                  children: [
                    const Expanded(
                      flex: 6,
                      child: GraphScreenWeb(),
                    ),
                    Expanded(
                      flex: 5,
                      child: PageView.builder(
                        controller: _pageController,
                        physics: const ClampingScrollPhysics(),
                        onPageChanged: (int index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemCount: OrderProvider.cardsForWeb.length,
                        itemBuilder: (context, index) {
                          return AnimatedBuilder(
                            animation: _pageController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _currentPage == index ? 1.2 : 1,
                                child: Center(
                                  child: CardWidget(
                                    order: OrderProvider.cardsForWeb[index],
                                    size: size,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
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

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.order, required this.size})
      : super(key: key);

  final CardModel order;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .25,
      height: size.height * .6,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: order.circleColor,
              ),
              child: Transform.scale(
                scale: .6,
                child: Image.asset(
                  order.icon!,
                  color: order.iconcolor,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            order.ordersNm!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              order.text!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xffA3A2A2),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
