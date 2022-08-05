import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CustomCalendar());
  }

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarFormat selectedFormat = CalendarFormat.month;
  final List<String> calendarFormats = ['cycle', 'day', 'month', 'year'];
  void _showPopupMenu({required String selectedFormat}) async {
    await showMenu(
      context: context,
      initialValue: selectedFormat,
      position: const RelativeRect.fromLTRB(15, 0, 100, 350),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      items: calendarFormats
          .map<PopupMenuItem<String>>(
            (format) => PopupMenuItem(
              value: format,
              onTap: () {
                setState(() => {});
              },
              child: MenuFieldChild(
                text: format,
              ),
            ),
          )
          .toList(),
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              ListTile(
                leading: InkWell(
                  onTap: () {
                    _showPopupMenu(selectedFormat: selectedFormat.name);
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.deepOrangeAccent.withOpacity(0.3),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.purple,
                      size: 22,
                    ),
                  ),
                ),
                title: Text(
                  selectedFormat.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.close,
                  color: Colors.purple,
                ),
              ),
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                calendarFormat: selectedFormat,
                eventLoader: (day) {
                  if (day.day == 8 && day.month == 8) {
                    return [day];
                  }
                  return [];
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: const BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                  markerSize: 40,
                  markersAlignment: Alignment.center,
                  markersAutoAligned: false,
                  markerDecoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                  ),
                ),
                onFormatChanged: (format) {
                  setState(() {
                    selectedFormat = format;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuFieldChild extends StatelessWidget {
  const MenuFieldChild({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
