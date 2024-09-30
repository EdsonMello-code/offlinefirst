import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:offlinefirst/app/products/drivers/database/product_table.dart';

part 'drift_config.g.dart';

@DriftDatabase(tables: [ProductTable])
class DriftConfig extends _$DriftConfig {
  // After generating code, this class needs to define a `schemaVersion` getter

  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/getting-started/#open
  DriftConfig._() : super(_openConnection());

  static final DriftConfig _instance = DriftConfig._();

  factory DriftConfig() => _instance;

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.
    return driftDatabase(name: 'my_database');
  }
}
