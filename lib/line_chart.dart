import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    Key? key,
    required this.maxX,
    required this.maxY,
    this.extraLines,
    this.lineBarsData = const [],
    required this.onSaveScreenshot,
  }) : super(key: key);

  static Route route({
    required double maxX,
    required double maxY,
    List<Map<String, dynamic>>? extraLines,
    List<Map<String, dynamic>>? lineBarsData,
    required VoidCallback onSaveScreenshot,
  }) {
    return MaterialPageRoute<void>(
      builder: (_) => Line(
        maxX: maxX,
        maxY: maxY,
        extraLines: extraLines,
        lineBarsData: lineBarsData,
        onSaveScreenshot: onSaveScreenshot,
      ),
    );
  }

  final double maxX;
  final double maxY;
  final List<Map<String, dynamic>>? extraLines;
  final List<Map<String, dynamic>>? lineBarsData;
  final VoidCallback onSaveScreenshot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Line Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: AspectRatio(
                aspectRatio: 1,
                child: _LineChart(
                  maxX: maxX,
                  maxY: maxY,
                  extraLines: extraLines,
                  lineBarsData: lineBarsData,
                ),
              ),
            ),
            ListTile(
              onTap: onSaveScreenshot,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text('Save Snapshot'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.screenshot_monitor,
                    size: 24,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart({
    required this.maxX,
    required this.maxY,
    this.extraLines = const [],
    this.lineBarsData = const [],
  });
  final double maxX;
  final double maxY;
  final List<Map<String, dynamic>>? extraLines;
  final List<Map<String, dynamic>>? lineBarsData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LineChart(
          sampleData1,
          swapAnimationDuration: const Duration(milliseconds: 250),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 65, left: 20),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              height: 80,
              width: 100,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(70.0),
                  ),
                ),
                child: const Center(
                    child: Text(
                  'Demo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: FlBorderData(
          show: false,
        ),
        lineBarsData: lineBarData(lineBarsData),
        minX: 0,
        maxX: maxX,
        maxY: maxY,
        minY: 0,
        extraLinesData: getExtraLinesData(extraLines),
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 7,
            getTitlesWidget: (value, meta) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('Wk${(value.toInt() ~/ 7) + 1}'),
            ),
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            interval: 2,
            showTitles: true,
            getTitlesWidget: (value, meta) => Text('${value.toInt()}'),
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            interval: 2,
            showTitles: true,
            getTitlesWidget: (value, meta) => Text('${value.toInt() * 10}'),
          ),
        ),
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawVerticalLine: false,
      );

  ExtraLinesData getExtraLinesData(List<Map<String, dynamic>>? extraLines) {
    if (extraLines == null || extraLines.isEmpty) {
      return ExtraLinesData();
    }

    final verticalLines = <VerticalLine>[];
    final horizontalLines = <HorizontalLine>[];

    for (var extraLine in extraLines) {
      if (extraLine['axis'] == 'vertical') {
        final listX = extraLine['x'] as List<int>?;
        final listY = extraLine['y'] as List<int>?;
        if (listX != null && listX.isNotEmpty) {
          verticalLines.add(
            VerticalLine(
              x: listX.first.toDouble(),
              label: VerticalLineLabel(
                labelResolver: (p0) => extraLine['label'],
                show: true,
              ),
              color: extraLine['color'] != null
                  ? Color(int.parse(extraLine['color']))
                  : Colors.black,
              dashArray: (listY != null && listY.isNotEmpty) ? listY : null,
            ),
          );
        }
      } else {
        final listX = extraLine['x'] as List<int>?;
        final listY = extraLine['y'] as List<int>?;
        if (listY != null && listY.isNotEmpty) {
          horizontalLines.add(
            HorizontalLine(
              y: listY.first.toDouble(),
              label: HorizontalLineLabel(
                labelResolver: (p0) => extraLine['label'],
                show: true,
              ),
              color: extraLine['color'] != null
                  ? Color(int.parse(extraLine['color']))
                  : Colors.black,
              dashArray: (listX != null && listX.isNotEmpty) ? listX : null,
            ),
          );
        }
      }
    }

    return ExtraLinesData(
      horizontalLines: horizontalLines,
      verticalLines: verticalLines,
    );
  }

  List<LineChartBarData> lineBarData(
    List<Map<String, dynamic>>? lineBarsData,
  ) {
    if (lineBarsData == null || lineBarsData.isEmpty) {
      return [];
    }
    final lineChartBarData = <LineChartBarData>[];
    for (var line in lineBarsData) {
      final spots = <FlSpot>[];
      for (var spot in line['spots']) {
        spots.add(FlSpot(spot['x'], spot['y']));
      }
      lineChartBarData.add(
        LineChartBarData(
          isCurved: line['isCurved'] ?? true,
          color: Color(int.parse(line['color'])),
          barWidth: line['barWidth'] ?? 2.0,
          isStrokeCapRound: line['isStrokeCapRound'] ?? false,
          dotData: FlDotData(show: line['dotData']['show']),
          belowBarData: BarAreaData(
            show: line['belowBarData']['show'],
          ),
          spots: spots,
        ),
      );
    }
    return lineChartBarData;
  }
}
