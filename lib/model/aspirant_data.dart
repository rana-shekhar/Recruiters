class AspirantData {
  String name;
  String email;
  String phoneNumber;
  String resumePath;
  String coverLetter;
  String id;

  AspirantData({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.resumePath = '',
    this.coverLetter = '',
    required this.id,
  });

  /// Converts the object to a Map (useful for Firebase or APIs)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'resumePath': resumePath,
      'coverLetter': coverLetter,
      'id': id,
    };
  }

  /// Creates an object from a Map (useful when fetching data)
  factory AspirantData.fromMap(Map<String, dynamic> map) {
    return AspirantData(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      resumePath: map['resumePath'] ?? '',
      coverLetter: map['coverLetter'] ?? '',
      id: map['id'] ?? '',
    );
  }
}
