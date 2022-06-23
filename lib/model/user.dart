import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  int id;
  final String name;
  final String email;

  User({
    this.id = 0,
    required this.name,
    required this.email,
  });
}
