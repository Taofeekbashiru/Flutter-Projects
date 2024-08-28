class User {
  String fullname;
  String phoneNumber;

  User({
    required this.fullname,
    required this.phoneNumber,
  });
}

List<User> contactList = List.generate(20, (index) {
  return User(
    fullname: usernames[index],
    phoneNumber: '123-456-78${index % 10}', // Example phone number
  );
});

List<String> usernames = [
  "John Smith",
  "Jane Doe",
  "Michael Johnson",
  "Emily Brown",
  "David Taylor",
  "Emma Anderson",
  "Daniel Thomas",
  "Sophia Jackson",
  "Matthew White",
  "Olivia Harris",
  "James Martin",
  "Isabella Thompson",
  "Benjamin Garcia",
  "Mia Robinson",
  "William Clark",
  "Ava Lewis",
  "Alexander Lee",
  "Charlotte Walker",
  "Lucas Hall",
  "Amelia Allen",
  "Henry Young",
  "Harper King",
  "Elijah Wright",
  "Evelyn Scott",
  "Mason Torres",
  "Abigail Nguyen",
  "Sebastian Hill",
  "Ella Green",
  "Liam Adams",
  "Grace Baker"
];
