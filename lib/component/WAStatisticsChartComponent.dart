import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_flutter/utils/WAColors.dart';

class WAStatisticsChartComponent extends StatefulWidget {
  static String tag = '/WAStatisticsChartComponent';

  @override
  WAStatisticsChartComponentState createState() => WAStatisticsChartComponentState();
}

class WAStatisticsChartComponentState extends State<WAStatisticsChartComponent> {
  final Color leftBarColor = WAPrimaryColor;
  final Color rightBarColor = Colors.red;
  late final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Text('bar char was here '),
    ).paddingAll(16).center();
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData( color: leftBarColor, width: width, toY: y1),
        BarChartRodData(color: rightBarColor, width: width, toY: y2),
      ],
    );
  }
}
