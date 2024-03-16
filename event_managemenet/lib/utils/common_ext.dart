import 'dart:async';
import 'dart:math';

import 'package:intl/intl.dart';

extension StringsExtension on String {
  String sCap() {
    if (!isEmptyORNull) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } else {
      return this;
    }
  }

  String wordCap() {
    return isEmptyORNull
        ? ""
        : toLowerCase().split(' ').map((word) {
            final String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
            if (word.length > 1) {
              return word[0].toUpperCase() + leftText;
            } else {
              return word.toUpperCase() + leftText;
            }
          }).join(' ');
  }

  String commaCap() {
    return toLowerCase().split(',').map((word) {
      final String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      if (word.length > 1) {
        return word[0].toUpperCase() + leftText;
      } else {
        return word.toUpperCase() + leftText;
      }
    }).join(', ');
  }

  String justifyContent() {
    String newQuery = "";
    final kList = split(" ");
    for (var element in kList) {
      if (element.removeSpaces().isNotEmpty) {
        newQuery += " $element";
      }
    }
    if (newQuery.isEmpty) {
      newQuery = this;
    }
    return newQuery.trim();
  }

  String removeSpaces() => replaceAll(RegExp(r"\s+\b|\b\s"), "");

  bool get isEmptyORNull => isEmpty || removeSpaces().isEmpty;

  int toInt() => int.tryParse(this) ?? 0;

  double toDouble() => double.tryParse(this) ?? 0.0;

  Uri toUri() => Uri.parse(this);

  /// will return count of no of lines from passed string
  int get lines => '\n'.allMatches(this).length + 1;

  String? toMap() {
    var re = RegExp(r'(?<={)(.*)(?=})');
    var match = re.firstMatch(this);
    return match?.group(0);
  }

  String forImage() {
    if (isEmptyORNull) {
      return "";
    }
    final list = split(" ");
    final firstLetter = list[0].substring(0, 1);

    if (list.length >= 2) {
      final lastLetter = list[1].substring(0, 1);
      return (firstLetter + lastLetter).toUpperCase();
    }
    return firstLetter.toUpperCase();
  }

  String get paramSymbol {
    if (contains('?')) {
      return '&';
    }
    return '?';
  }

  String substringSafe(int start, [int? end]) {
    String s = this;

    if (end != null && end > s.length) {
      return s.substring(0, s.length);
    }

    if (end != null && end < s.length) {
      return s.substring(0, end);
    }

    return s;
  }
}

bool isBlank(String? s) => s == null || s.trim().isEmpty;

bool isNotBlank(String? s) => s != null && s.trim().isNotEmpty;

extension StringsNullExt on String? {
  String get v => (this == null || this == "") ? '' : this!;
}

extension Duplicates<T> on List<T> {
  void addAllByAvoidingDuplicates(Iterable<T> values) => replaceRange(0, length, {
        ...([...this] + [...values])
      });

  int get numberOfDuplicates => length - {...this}.length;

  bool get containsDuplicates => numberOfDuplicates > 0;

  List<T> get uniques => [
        ...{...this}
      ];

  void removeDuplicates() => replaceRange(
        0,
        length,
        uniques,
      );

  List<T> get duplicates => [
        for (var i = 0; i < length; i++) [...this].skip(i + 1).contains(this[i]) ? this[i] : null
      ].whereType<T>().toList();
}

extension IntsExtension on int {
  String timestampToString(String? formatted) {
    var format = DateFormat(formatted ?? 'MM-dd-yy HH:mm:ss');
    var date = DateTime.fromMillisecondsSinceEpoch(this);
    return format.format(date);
  }

  double toDouble() => double.parse(toString());

  String toStringAsFixed() => toString().toDouble().toStringAsFixed(2);
}

extension DoubletExtension on double {
  int toInt() {
    return int.parse(toString());
  }
}

extension ObjectExtention on Object? {
  int toInt() => int.parse(toString());

  double toDouble() => double.parse(toString());

  bool get isEmptyOrNull => isNull || toString().removeSpaces().isEmpty;

  bool get isNotEmptyAndNotNull => isNotNull && toString().removeSpaces().isNotEmpty;

  bool get isNotNull => this != null;

  bool get isNull => this == null;
}

extension RandomOfDigits on Random {
  int nextIntOfDigits(int digitCount) {
    assert(1 <= digitCount && digitCount <= 9);
    int min = digitCount == 1 ? 0 : pow(10, digitCount - 1).toInt();
    int max = pow(10, digitCount).toInt();
    return (min + nextInt(max - min)).toInt();
  }
}

extension MapExtention<V> on Map {
  V addIt(String key, V value) => update(key, (dynamic k) => value, ifAbsent: () => value);

  Object? valueFor({required String keyPath}) {
    final keysSplit = keyPath.split('.');
    final thisKey = keysSplit.removeAt(0);
    final thisValue = this[thisKey];
    if (keysSplit.isEmpty) {
      return thisValue;
    } else if (thisValue is Map) {
      return thisValue.valueFor(keyPath: keysSplit.join('.'));
    }
    return null;
  }
}

extension BooleanExt on bool? {
  bool get isNullOrFalse => this == null || this == false;
}

extension TakeFor<T> on Stream<T> {
  // Stream<DateTime> source() => Stream.periodic(
  //       const Duration(milliseconds: 500),
  //       (_) => DateTime.now(),
  //     );
  //
  // void testIt() async {
  //   await for (final dateTime in source().takeFor(
  //     const Duration(seconds: 4),
  //   )) {
  //     print('date time is $dateTime');
  //   }
  // }

  Stream<T> takeFor(Duration duration) {
    final upTo = DateTime.now().add(duration);
    return takeWhile((_) {
      final now = DateTime.now();
      return now.isBefore(upTo) | now.isAtSameMomentAs(upTo);
    });
  }
}

extension Unique<E, Id> on List<E> {
  List<E> unique([Id Function(E element)? id, bool inplace = true]) {
    final ids = <dynamic>{};
    var list = inplace ? this : List<E>.from(this);
    list.retainWhere((x) => ids.add(id != null ? id(x) : x as Id));
    return list;
  }
}

extension DateTimeExt on DateTime {
  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  int get weekNumber {
    int dayOfYear = int.parse(DateFormat("D").format(this));
    int woy = ((dayOfYear - weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks(year - 1);
    } else if (woy > numOfWeeks(year)) {
      woy = 1;
    }
    return woy;
  }
}
