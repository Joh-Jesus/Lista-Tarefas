import 'package:floor/floor.dart';

class EntityBase {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String createAt;

  EntityBase(
    this.id,
    this.createAt,
  );
}
