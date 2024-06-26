import 'package:drift/drift.dart';
import 'connection/connection.dart' as impl;

import 'chat.dart';
import 'user.dart';

part 'drift.g.dart';

@DriftDatabase(tables: [DtoUsers, DtoChats])
class DriftProvider extends _$DriftProvider {
  DriftProvider() : super(impl.connect()) {
    notifyUpdates({for (final table in allTables) TableUpdate.onTable(table)});
  }

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, a, b) async {
        await m.createAll();
      },
    );
  }
}
