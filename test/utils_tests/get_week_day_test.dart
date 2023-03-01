import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/utils/get_week_day.dart';

void main() {
  test(
    "Utils getWeekDay should return S",
    () {
      String weekDay = GetWeekDay.get(1);
      expect(weekDay, "S");
    },
  );

  test(
    "Utils getWeekDay should return T",
    () {
      String weekDay = GetWeekDay.get(2);
      expect(weekDay, "T");
    },
  );

  test(
    "Utils getWeekDay should return Q",
    () {
      String weekDay = GetWeekDay.get(3);
      expect(weekDay, "Q");
    },
  );

  test(
    "Utils getWeekDay should return Q",
    () {
      String weekDay = GetWeekDay.get(4);
      expect(weekDay, "Q");
    },
  );
  test(
    "Utils getWeekDay should return S",
    () {
      String weekDay = GetWeekDay.get(5);
      expect(weekDay, "S");
    },
  );
  test(
    "Utils getWeekDay should return S",
    () {
      String weekDay = GetWeekDay.get(6);
      expect(weekDay, "S");
    },
  );
  test(
    "Utils getWeekDay should return D",
    () {
      String weekDay = GetWeekDay.get(7);
      expect(weekDay, "D");
    },
  );
}
