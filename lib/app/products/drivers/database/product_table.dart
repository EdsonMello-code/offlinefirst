import 'package:drift/drift.dart';

class ProductTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  RealColumn get price => real()();
  DateTimeColumn get buyDate => dateTime()();
  TextColumn? get image => text().nullable()();
}
