import 'package:ardilla/app/features/home/data/model/cash_flow_model.dart';
import 'package:ardilla/app/features/home/presentation/widgets/cash_flow_title_builder.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _LineChart extends StatelessWidget {
  final CashFlowModel cashFlowModel;
  const _LineChart({required this.cashFlowModel});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData2,
    );
  }

  LineChartData get sampleData2 => LineChartData(
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        lineBarsData: lineBarsData2,
        minX: 0,
        maxX: 14,
        maxY: 6,
        minY: 0,
      );

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        show: false,
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData2_2,
        lineChartBarData2_3,
      ];

  SideTitles get bottomTitles => SideTitles(
        showTitles: false,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
        isCurved: true,
        color: Color.fromRGBO(255, 113, 139, 1),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 113, 139, 0.3),
                Color.fromRGBO(255, 113, 139, 0.08)
              ]),
        ),
        spots: cashFlowModel.dataPoints1,
      );

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
        isCurved: true,
        color: Color(0xff8807F7),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: cashFlowModel.dataPoints2,
      );
}

class LineBuilder extends StatefulWidget {
  final CashFlowModel cashFlowModel;
  const LineBuilder({super.key, required this.cashFlowModel});

  @override
  State<StatefulWidget> createState() => LineBuilderState();
}

class LineBuilderState extends State<LineBuilder> {
  late CashFlowModel cashFlowModel;

  @override
  void initState() {
    super.initState();
    cashFlowModel = widget.cashFlowModel;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: CashFlowTitle(
              flowChange: cashFlowModel.flowChange,
            ),
          ),
          Stack(
            children: <Widget>[
              Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  SizedBox(
                      height: 60,
                      child: _LineChart(cashFlowModel: cashFlowModel)),
                  Positioned(
                    right: 30,
                    bottom: 5,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Color.fromRGBO(255, 113, 139, 1),
                            ),
                            Text(
                              cashFlowModel.data1,
                              style: primaryTextTheme.titleMedium,
                            )
                          ],
                        ),
                        SizedBox(width: 4,),
                        Row(
                          children: [
                            const Icon(Icons.circle),
                            Text(cashFlowModel.data2,
                            style: primaryTextTheme.titleMedium,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
