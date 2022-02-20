import 'package:flap_kap/common/assets.dart';
import 'package:flap_kap/data/orders_data.dart';
import 'package:flap_kap/model/card_model.dart';
import 'package:flap_kap/model/order_model.dart';
import 'package:flap_kap/model/sales_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  List<double> prices = [];
  double sum = 0;
  double avg = 0;
  List<String> returnedOrders = [];
  int numberOfReturnedOrders = 0;

  double getAvg() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      prices.add(order.price!);
      sum += order.price!;
    }
    avg = sum / data.length;
    return avg;
  }

  int getNumberOfReturnedOrders() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      if (order.status!.contains('RETURNED')) {
        returnedOrders.add(order.status!);
      }
    }
    numberOfReturnedOrders = returnedOrders.length;
    return numberOfReturnedOrders;
  }

  static final cardsForPhone = [
    null,
    CardModel(
      icon: Assets.shoppingBag,
      iconcolor: Colors.green,
      ordersNm: data.length.toString(),
      text: 'Total number of orders in 2021',
      circleColor: Colors.greenAccent.withOpacity(0.1),
    ),
    CardModel(
      icon: Assets.average,
      iconcolor: Colors.blue,
      ordersNm: OrderProvider().getAvg().toInt().toString() + '\$',
      text: 'Average price of orders in 2021',
      circleColor: Colors.blueAccent.withOpacity(0.1),
    ),
    CardModel(
      icon: Assets.returnBox,
      iconcolor: Colors.red,
      ordersNm: OrderProvider().getNumberOfReturnedOrders().toString(),
      text: 'Total number of returned orders in 2021',
      circleColor: Colors.redAccent.withOpacity(0.1),
    ),
  ];

  static final cardsForWeb = [
    CardModel(
      icon: Assets.shoppingBag,
      iconcolor: Colors.green,
      ordersNm: data.length.toString(),
      text: 'Total number of orders in 2021',
      circleColor: Colors.greenAccent.withOpacity(0.1),
    ),
    CardModel(
      icon: Assets.average,
      iconcolor: Colors.blue,
      ordersNm: OrderProvider().getAvg().toInt().toString() + '\$',
      text: 'Average price of orders in 2021',
      circleColor: Colors.blueAccent.withOpacity(0.1),
    ),
    CardModel(
      icon: Assets.returnBox,
      iconcolor: Colors.red,
      ordersNm: OrderProvider().getNumberOfReturnedOrders().toString(),
      text: 'Total number of returned orders in 2021',
      circleColor: Colors.redAccent.withOpacity(0.1),
    ),
  ];

  int monthlyOrders = 0;
  List<int> ordersData = [];
  static final List<SalesModel> sales = [];

  getOrders() {
    for (int j = 1; j <= 12; j++) {
      for (int i = 0; i < data.length; i++) {
        OrderModel order = OrderModel.fromJson(data[i]);

        if (order.date!.contains('2021-0$j')) {
          monthlyOrders++;
        }
        ordersData.add(monthlyOrders);
      }
      sales.add(SalesModel(j, monthlyOrders));
      print('month $j orders are: $monthlyOrders');

      monthlyOrders = 0;
    }
  }
}
