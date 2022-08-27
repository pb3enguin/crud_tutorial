import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

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
      type: PlutoColumnType.text(),
    ),
  ];

  final List<PlutoRow> rows = [
    PlutoRow(
      cells: {
        'name': PlutoCell(value: 'user1'),
        'telNo': PlutoCell(value: 'Mike'),
        'birthday': PlutoCell(value: 20),
      },
    ),
    PlutoRow(
      cells: {
        'name': PlutoCell(value: 'user2'),
        'telNo': PlutoCell(value: 'Jack'),
        'birthday': PlutoCell(value: 25),
      },
    ),
    PlutoRow(
      cells: {
        'name': PlutoCell(value: 'user3'),
        'telNo': PlutoCell(value: 'Suzi'),
        'birthday': PlutoCell(value: 40),
      },
    ),
  ];

  /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
  late final PlutoGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
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
    );
  }
}
