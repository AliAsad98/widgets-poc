import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// https://pub.dev/packages/fl_chart
class Scatter extends StatelessWidget {
  const Scatter({
    Key? key,
    required this.scatterData,
    required this.maxX,
    required this.maxY,
    required this.onSaveScreenshot,
  }) : super(key: key);

  static Route route({
    required List<Map<String, dynamic>> scatterData,
    required double maxX,
    required double maxY,
    required VoidCallback onSaveScreenshot,
  }) {
    return MaterialPageRoute<void>(
      builder: (_) => Scatter(
        scatterData: scatterData,
        maxX: maxX,
        maxY: maxY,
        onSaveScreenshot: onSaveScreenshot,
      ),
    );
  }

  final List<Map<String, dynamic>> scatterData;
  final double maxX;
  final double maxY;
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
        title: const Text('Scatter'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 48,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: AspectRatio(
                aspectRatio: 1.5,
                child: ScatterChart(
                  ScatterChartData(
                    scatterSpots: dataMapping(scatterData),
                    minX: 0,
                    maxX: maxX,
                    minY: 0,
                    maxY: maxY,
                    borderData: FlBorderData(
                      show: false,
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      getDrawingHorizontalLine: (value) => FlLine(
                        strokeWidth: 0.5,
                        color: Colors.grey,
                      ),
                      drawVerticalLine: false,
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          interval: 7,
                          showTitles: true,
                          getTitlesWidget: (value, meta) => Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text('WK${(value ~/ 7).toInt() + 1}'),
                          ),
                        ),
                      ),
                      topTitles: AxisTitles(),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          interval: 2,
                          showTitles: true,
                          getTitlesWidget: (value, meta) =>
                              Text('${value.toInt()}'),
                        ),
                      ),
                      rightTitles: AxisTitles(),
                    ),
                    scatterTouchData: ScatterTouchData(
                      enabled: false,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Wrap(
              children: scatterData
                  .map(
                    (e) => SizedBox(
                      width: 120,
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Color(int.parse(e['color'])),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            e['name'],
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
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

  List<ScatterSpot> dataMapping(List<Map<String, dynamic>> scatterData) {
    final scatetrSpots = <ScatterSpot>[];

    for (var spotsData in scatterData) {
      for (var spotAxisData in spotsData['spots']) {
        scatetrSpots.add(
          ScatterSpot(
            (spotAxisData['x'] as double),
            (spotAxisData['y'] as double),
            color: Color(int.parse(spotsData['color'])),
            radius: (spotsData['radius'] as int).toDouble(),
          ),
        );
      }
    }

    return scatetrSpots;
  }
}
