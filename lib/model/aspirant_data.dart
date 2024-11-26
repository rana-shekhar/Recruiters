class AspirantData {
  String? name;
  String? email;
  String? phoneNumber;
  String? resumePath;
  String? coverLetter;

  AspirantData({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.resumePath = '',
    this.coverLetter = '',
  });

  /// Converts the object to a Map (useful for Firebase or APIs)
  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'email': email,
  //     'phoneNumber': phoneNumber,
  //     'resumePath': resumePath,
  //     'coverLetter': coverLetter,
  //   };
  // }

  /// Creates an object from a Map (useful when fetching data)
//   factory FormFieldData.fromMap(Map<String, dynamic> map) {
//     return FormFieldData(
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//       phoneNumber: map['phoneNumber'] ?? '',
//       resumePath: map['resumePath'] ?? '',
//       coverLetter: map['coverLetter'] ?? '',
//     );
//   }
}
