class UserService {
  Future<Map<String, String>> fetchUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return {
      'name': 'Alice',
      'email': 'alice@example.com',
    };
  }
}
