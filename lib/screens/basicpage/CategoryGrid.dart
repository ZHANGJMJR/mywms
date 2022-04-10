import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mywms/module/category.dart';

/// DataGrid import
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:mywms/widgets/myextension.dart';
import 'package:mywms/widgets/mywidgets.dart';

class CategoryGrid extends StatelessWidget {
  List<Category> _category = [];
  final DataGridController _categoryGridController = DataGridController();
  final CategoryDataGridSource _categoryDataGridSource = CategoryDataGridSource();
  CategoryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myDialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.QUESTION,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Dialog Title',
      width: 500,
      desc: 'Dialog description here.............',
      btnOkText: '确定',
      btnCancelText: '取消',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    );

    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              myDialog.show();
            },
            child: 'show dialog'.toLabel(fontsize: 20)),
        Form(child: Container(child: 'form'.toLabel(),),),
        Expanded(
            child:   SfDataGrid(
                source: _categoryDataGridSource,
                columns:  [
                  GridColumn(
                      columnName: 'id',
                      label:  Container(
                          padding:const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.center,
                          child:const Text(
                            'ID',
                            overflow: TextOverflow.ellipsis,
                          ))),
                  GridColumn(
                      columnName: 'name',
                      width: 160,
                      label: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            '类别名称',
                            overflow: TextOverflow.ellipsis,
                          ))),
                  GridColumn(
                      columnName: 'designation',
                      label: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            '图标',
                            overflow: TextOverflow.ellipsis,
                          ))),

                ],
                controller: _categoryGridController,
                isScrollbarAlwaysShown: true,
                checkboxColumnSettings: const DataGridCheckboxColumnSettings(
                  backgroundColor: Colors.amber,
                ),
                showCheckboxColumn: true,
                allowColumnsResizing: true,
                selectionMode: SelectionMode.multiple,
              ),
          ),
      ],
    );
  }
}

class CategoryDataGridSource extends DataGridSource {
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // TODO: implement buildRow
    throw UnimplementedError();
  }
}
