
import 'package:flutter/material.dart';
import 'package:mywms/module/category.dart';
/// DataGrid import
import 'package:syncfusion_flutter_datagrid/datagrid.dart';



class CategoryGrid extends StatelessWidget {
  List<Category> _category =[];
  final DataGridController _categoryGridController = DataGridController();
  CategoryDataGridSource _categoryDataGridSource = CategoryDataGridSource();
  CategoryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child:
      SfDataGrid(
        source: _categoryDataGridSource,columns: [],
        controller: _categoryGridController,
        isScrollbarAlwaysShown: true,
        checkboxColumnSettings: DataGridCheckboxColumnSettings(
            backgroundColor: Colors.amber,
        ),showCheckboxColumn: true,
        allowColumnsResizing: true,
        selectionMode: SelectionMode.multiple,
      ),);
  }
}
class CategoryDataGridSource   extends DataGridSource{
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // TODO: implement buildRow
    throw UnimplementedError();
  }

}