import 'package:intl/intl.dart';

String formatEpochTime(int epochTime) {
  final dateTime =
      DateTime.fromMillisecondsSinceEpoch(epochTime * 1000, isUtc: true)
          .toLocal();
  final formatter = DateFormat('EEEE, MMMM d, yyyy \'@\' h:mm a');
  final formattedTime = formatter.format(dateTime);
  return formattedTime;
}
