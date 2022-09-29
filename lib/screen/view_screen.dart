import 'dart:developer';

import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';

import '../function/info_data.dart';
import '../function/person_info_firestore.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      title: '이름',
      field: 'name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: '전화번호',
      field: 'telNo',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: '생년월일',
      field: 'birthday',
      type: PlutoColumnType.date(),
    ),
  ];

  final List<PlutoRow> rows = [];

  var snapshots;

  /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
  late final PlutoGridStateManager stateManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<FireStorePersonInfo>().getCollection().then((collection) {
      for (Document doc in collection) {
        // Document type
        print(PersonInfo.fromJson(doc.map));

        stateManager.refRows.add(PersonInfo.fromJson(doc.map).getPlutoRow());
      }
    });
    // TODO: error, exception handling
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IconButton(
            onPressed: () async {
              await context.read<FireStorePersonInfo>().getCollection();
            },
            icon: const Icon(Icons.refresh),
          ),
          Expanded(
            child: PlutoGrid(
              columns: columns,
              rows: rows,
              // columnGroups: columnGroups,
              onLoaded: (PlutoGridOnLoadedEvent event) {
                stateManager = event.stateManager;
              },
              onChanged: (PlutoGridOnChangedEvent event) {
                log(event.value);
              },
              configuration: const PlutoGridConfiguration(
                style: PlutoGridStyleConfig(
                  borderColor: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
