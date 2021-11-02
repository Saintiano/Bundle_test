class UserData {
  late var uid;
  late String email;
  late String name;
  late String photoUrl;

  late String username;
  late String company;
  late String position;
  late String phone_number;
  late String date_of_registration;

  late String state;
  late String address;
  late String gender;
  late String total_hours_worked;
  late String total_revenue_generated;
  late String active;
  late String userId;

  UserData.fromJson(this.uid, Map data) {
    name = data['name'];
    company = data['company'];
    photoUrl = data['photoUrl'];
    username = data['username'];
    email = data['email'];
    position = data['position'];
    phone_number = data['phone_number'];
    date_of_registration = data['date_of_registration'];
    state = data['state'];
    address = data['address'];
    gender = data['gender'];
    total_hours_worked = data['total_hours_worked'];
    total_revenue_generated = data['total_revenue_generated'];
    active = data['active'];
    userId = data['uid'];

    // name ??= "";
    // company ??= "";
    // photoUrl ??= "";
    // username ??= "";
    // email ??= "";
    // email ??= "";
    // position ??= "";
    // phone_number ??= "";
    // date_of_registration ??= "";
    // state ??= "";
    // address ??= "";
    // gender ??= "";
    // total_hours_worked ??= "";
    // total_revenue_generated ??= "";
    // active ??= "";
    // userId ??= "";

  }
}