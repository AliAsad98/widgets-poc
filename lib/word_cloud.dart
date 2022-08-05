import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';

// https://pub.dev/packages/flutter_scatter
class WordCloud extends StatelessWidget {
  const WordCloud({Key? key, required this.words}) : super(key: key);

  static Route route({required Map<String, int> words}) {
    return MaterialPageRoute<void>(
      builder: (_) => WordCloud(
        words: words,
      ),
    );
  }

  final Map<String, dynamic> words;
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    words.forEach((key, value) {
      widgets.add(Text(
        key,
        style: getTextStyle(value as int),
      ));
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Word Cloud'),
      ),
      body: Center(
        child: Scatter(
          children: widgets,
        ),
      ),
    );
  }

  TextStyle getTextStyle(int frequency) {
    const baseSize = 14.0;
    return TextStyle(
      fontSize: frequency == 1 ? baseSize : baseSize + frequency,
      color: Colors.black,
    );
  }
}
