import 'package:flap_kap/model/sales_model.dart';
import 'package:flap_kap/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    OrderProvider().getOrdersSalesPerMonth();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCartesianChart(
          title: ChartTitle(
              text: '2021 Orders',
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              )),
          backgroundColor: Colors.black,
          tooltipBehavior: _tooltipBehavior,
          //legend: Legend(isVisible: true),
          series: <SplineSeries>[
            SplineSeries<SalesModel, int>(
              dataSource: OrderProvider.sales,
              xValueMapper: (SalesModel sales, _) => sales.month,
              yValueMapper: (SalesModel sales, _) => sales.sales,
              markerSettings:
                  const MarkerSettings(isVisible: true, borderWidth: 5),
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              //dashArray: const [20, 5],
              enableTooltip: true,
              splineType: SplineType.cardinal,
              width: 3,
              color: Colors.green,
            )
          ],
          primaryXAxis: NumericAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            labelStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          primaryYAxis: NumericAxis(
            labelStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
