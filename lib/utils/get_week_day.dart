class GetWeekDay {
  static get(int weekDayNumber) {
    switch (weekDayNumber) {
      case 1:
        return "S";
      case 2:
        return "T";
      case 3:
        return "Q";
      case 4:
        return "Q";
      case 5:
        return "S";
      case 6:
        return "S";
      default:
        return "D";
    }
  }
}
