import 'package:fl_chart/fl_chart.dart';

class CashFlowModel {
  final String data1;
  final List<FlSpot> dataPoints1;
  final List<FlSpot> dataPoints2;
  final String data2;
  final String flowChange;

  CashFlowModel({
    required this.data1,
    required this.dataPoints1,
    required this.dataPoints2,
    required this.data2,
    required this.flowChange,
  });

  factory CashFlowModel.fromMap(Map<String, dynamic> json) => CashFlowModel(
      data1: json["data1"],
      dataPoints1: List<FlSpot>.from(json["dataPoints1"].map((x) {
        print("hhhh $x");
        return FlSpot(x[0].toDouble(), x[1].toDouble());
      })),
      dataPoints2: List<FlSpot>.from(json["dataPoints2"]
          .map((x) {
        print("hhhh $x");
        return FlSpot(x[0].toDouble(), x[1].toDouble());
      })),
      data2: json["data2"],
      flowChange: json["flowChange"]);

  // Map<String, dynamic> toMap() => {
  //       "name": data1,
  //       "rating": dataPoints1,
  //       "message": dataPoints2,
  //       "time": data2,
  //       "photo": flowChange
  //     };
}
