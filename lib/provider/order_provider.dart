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

  int janOrders = 0;
  int getJanOrders() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      if (order.date!.contains('2021-01')) {
        janOrders++;
      }
    }
    return janOrders;
  }

  int febOrders = 0;
  int getFebOrders() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      if (order.date!.contains('2021-02')) {
        febOrders++;
      }
    }
    return febOrders;
  }

  int marchOrders = 0;
  int getMarchOrders() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      if (order.date!.contains('2021-03')) {
        marchOrders++;
      }
    }
    return marchOrders;
  }

  int aprilOrders = 0;
  int getAprilOrders() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      if (order.date!.contains('2021-04')) {
        aprilOrders++;
      }
    }
    return aprilOrders;
  }

  int mayOrders = 0;
  int getMayOrders() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      if (order.date!.contains('2021-05')) {
        mayOrders++;
      }
    }
    return mayOrders;
  }

  int juneOrders = 0;
  int getJuneOrders() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      if (order.date!.contains('2021-06')) {
        juneOrders++;
      }
    }
    return juneOrders;
  }

  int julyOrders = 0;
  int getJulyOrders() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      if (order.date!.contains('2021-07')) {
        julyOrders++;
      }
    }
    return julyOrders;
  }

  int augOrders = 0;
  int getAugOrders() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      if (order.date!.contains('2021-08')) {
        augOrders++;
      }
    }
    return augOrders;
  }

  int septOrders = 0;
  int getSeptOrders() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      if (order.date!.contains('2021-09')) {
        septOrders++;
      }
    }
    return septOrders;
  }

  int octOrders = 0;
  int getOctOrders() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      if (order.date!.contains('2021-10')) {
        octOrders++;
      }
    }
    return octOrders;
  }

  int novOrders = 0;
  int getNovOrders() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      if (order.date!.contains('2021-11')) {
        novOrders++;
      }
    }
    return novOrders;
  }

  int decOrders = 0;
  int getDecOrders() {
    for (int i = 0; i < data.length; i++) {
      OrderModel order = OrderModel.fromJson(data[i]);
      if (order.date!.contains('2021-12')) {
        decOrders++;
      }
    }
    return decOrders;
  }

  getOrdersSalesPerMonth() {
    OrderProvider().getJanOrders();
    OrderProvider().getFebOrders();
    OrderProvider().getMarchOrders();
    OrderProvider().getAprilOrders();
    OrderProvider().getMayOrders();
    OrderProvider().getJuneOrders();
    OrderProvider().getJulyOrders();
    OrderProvider().getAugOrders();
    OrderProvider().getSeptOrders();
    OrderProvider().getOctOrders();
    OrderProvider().getNovOrders();
    OrderProvider().getDecOrders();
 }

  static final sales = [
    SalesModel(01, OrderProvider().getJanOrders()),
    SalesModel(02, OrderProvider().getFebOrders()),
    SalesModel(03, OrderProvider().getMarchOrders()),
    SalesModel(04, OrderProvider().getAprilOrders()),
    SalesModel(05, OrderProvider().getMayOrders()),
    SalesModel(06, OrderProvider().getJuneOrders()),
    SalesModel(07, OrderProvider().getJulyOrders()),
    SalesModel(08, OrderProvider().getAugOrders()),
    SalesModel(09, OrderProvider().getSeptOrders()),
    SalesModel(10, OrderProvider().getOctOrders()),
    SalesModel(11, OrderProvider().getNovOrders()),
    SalesModel(12, OrderProvider().getDecOrders()),
  ];
}
