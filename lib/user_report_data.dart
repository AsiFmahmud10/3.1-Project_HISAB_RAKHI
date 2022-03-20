class UserReoprtData {
  String name;
  int Due;
  int deposit;
  String date;

  UserReoprtData(
      {required this.name,
      required this.Due,
      required this.deposit,
      required this.date});

  static List<UserReoprtData> getUsers() {
    return <UserReoprtData>[
      UserReoprtData(name: "mehedi", Due: 20, deposit: 20, date: "march"),
      UserReoprtData(name: "asif", Due: 20, deposit: 20, date: "march"),
    ];
  }
}
