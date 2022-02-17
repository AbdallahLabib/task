import 'package:flap_kap/UI/phone/graph_screen_phone.dart';
import 'package:flap_kap/model/card_model.dart';
import 'package:flap_kap/provider/order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumericMetricsPhone extends StatefulWidget {
  const NumericMetricsPhone({Key? key}) : super(key: key);

  @override
  State<NumericMetricsPhone> createState() => _NumericMetricsPhoneState();
}

class _NumericMetricsPhoneState extends State<NumericMetricsPhone> {
  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.7);

  double page = 1;
  double pageClamp = 1;

  //int _currentPage = 0;

  late Size size;
  double verPos = 0.0;

  Duration defaultDuration = const Duration(milliseconds: 300);

  void pageListener() {
    setState(() {
      page = _pageController.page!;
      pageClamp = page.clamp(0, 1);
    });
  }

  @override
  void initState() {
    _pageController.addListener(() {
      pageListener();
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(() {
      pageListener();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FC),
      appBar: page < 0.3
          ? null
          : AppBar(
              backgroundColor: Colors.black,
              toolbarHeight: 100,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(top: 20),
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
      body: 
          /* PageView.builder(
            controller: _pageController,
            physics: const ClampingScrollPhysics(),
            itemCount: OrderProvider.cards.length,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _currentPage == index ? 1.3 : 1,
                    child: CardWidget(order: OrderProvider.cards[index]!),
                  );
                },
              );
            },
          ), */
      Stack(
        children: [
          ///process overview
          Positioned(
            top: 20,
            left: 20,
            child: Row(
              children: [
                Text(
                  'Process overview',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 50),
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
          ),

          /// Add card background
          Positioned(
            top: pageClamp * size.height * .17 + verPos,
            bottom: pageClamp * size.height * .17 - verPos,
            left: pageClamp * size.width * .1,
            right: pageClamp * size.width * .2,
            child: Transform.translate(
              offset: Offset(
                page > 1 ? 0 : (-1 * page * size.width + size.width),
                0,
              ),
              child: page <= 1.01
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(pageClamp * 35),
                      ),
                    )
                  : Container(),
            ),
          ),

          /// Add card
          AnimatedSwitcher(
            duration: defaultDuration,
            child: page < 0.3 ? const GraphScreenPhone() : null,
          ),

          /// cards list
          Positioned(
            top: page == 0 ? 0 : (size.height * .17) + verPos,
            bottom: page == 0 ? 0 : size.height * .16 - verPos,
            left: 0,
            right: 0,
            child: PageView(
              controller: _pageController,
              children: OrderProvider.cardsForPhone
                  .map(
                    (e) => e == null
                        ? const SizedBox.shrink()
                        : Transform.translate(
                            offset: Offset(
                              page < 1 ? (1 - pageClamp) * 50 : 0,
                              0,
                            ),
                            child: CardWidget(order: e),
                          ),
                  )
                  .toList(),
            ),
          ),
        ], 
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.order}) : super(key: key);

  final CardModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
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
