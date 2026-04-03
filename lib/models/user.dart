class User {
  final String name;
  final String email;
  final String phone;
  final String city;
  final String country;
  final String avatar;
  final String gender;
  final int age;
  final String street;
  final String username;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.country,
    required this.avatar,
    required this.gender,
    required this.age,
    required this.street,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: "${json['name']['first']} ${json['name']['last']}",
      email: json['email'],
      phone: json['phone'],
      city: json['location']['city'],
      country: json['location']['country'],
      avatar: json['picture']['large'],
      gender: json['gender'],
      age: json['dob']['age'],
      street: "${json['location']['street']['name']} ${json['location']['street']['number']}",
      username: json['login']['username'],
    );
  }
}
