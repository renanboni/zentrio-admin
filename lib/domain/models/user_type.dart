enum UserType {
  user,
  vendor,
  none;

  static UserType fromString(String userTypeString) {
    return UserType.values.firstWhere(
          (e) => e.toString().split('.').last == userTypeString,
      orElse: () => throw Exception('Unknown user type: $userTypeString'),
    );
  }
}


