import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class CountdownTimerWidget extends StatelessWidget {
  final TextStyle textStyle;

  CountdownTimerWidget({required this.textStyle});

  final int endTime = DateTime(
    2021,
    DateTime.may,
    24,
  ).millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 500,
        child: CountdownTimer(
          endTime: endTime,
          widgetBuilder: (_, time) {
            if (time == null) {
              return Text(
                'See You Next Year',
                style: textStyle,
              );
            }

            return Table(
              children: [
                TableRow(children: [
                  TableCellWidget(
                    value: time.days.toString(),
                    textStyle: textStyle,
                  ),
                  TableCellWidget(
                    value: time.hours.toString(),
                    textStyle: textStyle,
                  ),
                  TableCellWidget(
                    value: time.min.toString(),
                    textStyle: textStyle,
                  ),
                ]),
                TableRow(children: [
                  TableCellWidget(
                    value: 'Days',
                    textStyle: textStyle,
                  ),
                  TableCellWidget(
                    value: 'Hours',
                    textStyle: textStyle,
                  ),
                  TableCellWidget(
                    value: 'Minuets',
                    textStyle: textStyle,
                  ),
                ]),
              ],
            );
          },
        ),
      );
}

class TableCellWidget extends StatelessWidget {
  final String value;
  final TextStyle textStyle;
  const TableCellWidget({
    required this.value,
    required this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TableCell(
          child: Center(
        child: Text(
          value,
          style: textStyle.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));
}
