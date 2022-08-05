import 'package:flutter/material.dart';
import 'package:poc/calendar.dart';
import 'package:poc/line_chart.dart';
import 'package:poc/scatter.dart';
import 'package:poc/word_cloud.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var words = {
      'Apple': 3,
      'Banana': 6,
      'Mango': 4,
      'Strawberry': 2,
      'Pineapple': 10,
      'Cherry': 4,
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charts'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Word Cloud'),
              onTap: () =>
                  Navigator.of(context).push(WordCloud.route(words: words)),
            ),
            ListTile(
              title: const Text('Scatter'),
              onTap: () => Navigator.of(context).push(Scatter.route(
                maxX: 28,
                maxY: 12,
                scatterData: [
                  {
                    'name': 'Cramps',
                    'color': '0xff450430',
                    'radius': 3,
                    'spots': [
                      {
                        'x': 5.0,
                        'y': 7.0,
                      },
                      {
                        'x': 28.0,
                        'y': 8.0,
                      },
                      {
                        'x': 6.0,
                        'y': 9.0,
                      },
                      {
                        'x': 13.0,
                        'y': 10.0,
                      },
                      {
                        'x': 4.0,
                        'y': 2.0,
                      },
                      {
                        'x': 10.0,
                        'y': 1.0,
                      },
                      {
                        'x': 3.0,
                        'y': 7.0,
                      },
                      {
                        'x': 8.0,
                        'y': 12.0,
                      },
                      {
                        'x': 17.0,
                        'y': 12.0,
                      },
                    ],
                  },
                  {
                    'name': 'Nausea',
                    'color': '0xffEC920C',
                    'radius': 5,
                    'spots': [
                      {
                        'x': 15.5,
                        'y': 7.9,
                      },
                      {
                        'x': 20.5,
                        'y': 8.7,
                      },
                      {
                        'x': 6.3,
                        'y': 9.7,
                      },
                      {
                        'x': 13.1,
                        'y': 10.2,
                      },
                      {
                        'x': 5.0,
                        'y': 3.0,
                      },
                      {
                        'x': 10.0,
                        'y': 2.0,
                      },
                      {
                        'x': 8.0,
                        'y': 9.0,
                      },
                      {
                        'x': 8.8,
                        'y': 10.0,
                      },
                      {
                        'x': 17.9,
                        'y': 11.0,
                      },
                    ],
                  },
                  {
                    'name': 'Migraines',
                    'color': '0xff35A0F9',
                    'radius': 7,
                    'spots': [
                      {
                        'x': 14.5,
                        'y': 6.9,
                      },
                      {
                        'x': 21.5,
                        'y': 9.7,
                      },
                      {
                        'x': 1.3,
                        'y': 8.7,
                      },
                      {
                        'x': 14.1,
                        'y': 11.2,
                      },
                      {
                        'x': 15.0,
                        'y': 3.0,
                      },
                      {
                        'x': 12.0,
                        'y': 12.0,
                      },
                      {
                        'x': 8.0,
                        'y': 11.0,
                      },
                      {
                        'x': 6.8,
                        'y': 10.0,
                      },
                      {
                        'x': 7.9,
                        'y': 12.0,
                      },
                    ],
                  },
                ],
                onSaveScreenshot: () {},
              )),
            ),
            ListTile(
              title: const Text('Line chart'),
              onTap: () => Navigator.of(context).push(Line.route(
                onSaveScreenshot: () {},
                maxX: 28,
                maxY: 10,
                extraLines: [
                  {
                    'axis': 'vertical',
                    'label': 'demo Y',
                    'color': '0xff450430',
                    'x': [11],
                    'y': [
                      0,
                      2,
                      4,
                      6,
                      8,
                      10,
                    ]
                  },
                  {
                    'axis': 'horizontal',
                    'label': 'demo X',
                    'color': '0xff35A0F9',
                    'y': [7]
                  },
                ],
                lineBarsData: [
                  {
                    'isCurved': true,
                    'color': '0xff4af699',
                    'barWidth': 2.0,
                    'isStrokeCapRound': true,
                    'dotData': {
                      'show': false,
                    },
                    'belowBarData': {
                      'show': false,
                    },
                    'spots': [
                      {'x': 1.0, 'y': 1.0},
                      {'x': 3.0, 'y': 1.5},
                      {'x': 5.0, 'y': 1.4},
                      {'x': 7.0, 'y': 3.4},
                      {'x': 10.0, 'y': 2.0},
                      {'x': 12.0, 'y': 2.2},
                      {'x': 13.0, 'y': 1.8},
                    ],
                  },
                  {
                    'isCurved': true,
                    'color': '0xff9A4743',
                    'barWidth': 2.0,
                    'isStrokeCapRound': true,
                    'dotData': {
                      'show': false,
                    },
                    'belowBarData': {
                      'show': false,
                    },
                    'spots': [
                      {'x': 1.0, 'y': 1.0},
                      {'x': 3.0, 'y': 2.8},
                      {'x': 7.0, 'y': 1.2},
                      {'x': 10.0, 'y': 2.8},
                      {'x': 12.0, 'y': 2.6},
                      {'x': 13.0, 'y': 3.9},
                    ],
                  },
                  {
                    'isCurved': true,
                    'color': '0xff27b6fc',
                    'barWidth': 2.0,
                    'isStrokeCapRound': true,
                    'dotData': {
                      'show': false,
                    },
                    'belowBarData': {
                      'show': false,
                    },
                    'spots': [
                      {'x': 1.0, 'y': 2.8},
                      {'x': 3.0, 'y': 1.9},
                      {'x': 6.0, 'y': 3.0},
                      {'x': 10.0, 'y': 1.3},
                      {'x': 20.0, 'y': 2.5},
                    ],
                  },
                ],
              )),
            ),
            ListTile(
              title: const Text('Calendar'),
              onTap: () => Navigator.of(context).push(CustomCalendar.route()),
            ),
          ],
        ),
      ),
    );
  }
}
