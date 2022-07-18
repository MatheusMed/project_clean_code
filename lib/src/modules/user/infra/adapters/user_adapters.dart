import '../../domain/entities/user.dart';

class UserAdapters {
  static User fromJson(dynamic data) {
    return User(
      id: data["id"],
      name: data["name"],
      email: data["email"],
      telefone: data["phone"],
    );
  }
}
