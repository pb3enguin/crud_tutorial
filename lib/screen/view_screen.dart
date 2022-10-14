import 'dart:async';
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

    // TODO: error, exception handling
    fetchRows().then((fetchedRows) {
      /// When there are many rows and the UI freezes when the grid is loaded
      /// Initialize the rows asynchronously through the initializeRowsAsync method
      /// Add rows to stateManager.refRows.
      /// And disable the loading screen.
      PlutoGridStateManager.initializeRowsAsync(
        columns,
        fetchedRows,
      ).then((value) {
        stateManager.refRows.addAll(FilteredList(initialList: value));

        /// In this example,
        /// the loading screen is activated in the onLoaded callback when the grid is created.
        /// If the loading screen is not activated
        /// You must update the grid state by calling the stateManager.notifyListeners() method.
        /// Because calling setShowLoading updates the grid state
        /// No need to call stateManager.notifyListeners.
        stateManager.setShowLoading(false);
      });
    });
  }

  Future<List<PlutoRow>> fetchRows() {
    final Completer<List<PlutoRow>> completer = Completer();
    final List<PlutoRow> _rows = [];

    context.read<FireStorePersonInfo>().getCollection().then((collection) {
      for (Document doc in collection) {
        // Document type
        print(PersonInfo.fromJson(doc.map));

        _rows.add(PersonInfo.fromJson(doc.map).getPlutoRow());
      }

      completer.complete(_rows);
    });

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: PlutoGrid(
              columns: columns,
              rows: rows,
              // columnGroups: columnGroups,
              onLoaded: (PlutoGridOnLoadedEvent event) {
                stateManager = event.stateManager;

                /// When the grid is finished loading, enable loading.
                stateManager.setShowLoading(true);
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
