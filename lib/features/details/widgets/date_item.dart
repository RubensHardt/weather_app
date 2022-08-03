import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants.dart';

class DateItem extends StatelessWidget {
  final String date;

  const DateItem(this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateText = DateFormat('EEEE, MMMM d').format(DateTime.parse(date));
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Text(
        dateText,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    );
  }
}
