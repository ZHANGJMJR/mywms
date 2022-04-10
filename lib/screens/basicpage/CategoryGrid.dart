import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywms/module/category.dart';
import 'package:get/get.dart';

/// DataGrid import
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:mywms/widgets/myextension.dart';
import 'package:mywms/widgets/mywidgets.dart';

import '../../controller/category_controller.dart';

class CategoryGrid extends StatelessWidget {
  final CategoryController _categoryController = Get.put(CategoryController());
  List<Category> _category = [];
  final DataGridController _categoryGridController = DataGridController();
  final CategoryDataGridSource _categoryDataGridSource =
      CategoryDataGridSource();
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
        Form(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _categoryController.idController,
              decoration: const InputDecoration(
                  labelText: 'ID', border: OutlineInputBorder()),
              enabled: false,
            ).margin3.hPadding9.hPadding9,
            TextFormField(
              controller: _categoryController.titleController,
              validator: (value) {
                if ((value ?? '').length < 2) {
                  return '输入有效的分类名称！';
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                  labelText: '分类名称', border: OutlineInputBorder()),
            ).margin9.hPadding9
          ],
        )).padding6,
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: (int.parse(
                            _categoryController.idController.text == ''
                                ? '0'
                                : _categoryController.idController.text)) >
                        0
                    ? // ( (_categoryController.idController.text ??'0') ) > '0'?    // int (_categoryController.idController.text??'0')
                    MaterialStateProperty.all(const Color(0xFFFFB300))
                    : MaterialStateProperty.all(const Color(0xFF43A047))),
            onPressed: () {
              myDialog.show();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                (int.parse(_categoryController.idController.text == ''
                            ? '0'
                            : _categoryController.idController.text)) >
                        0
                    ? const Icon(Icons.edit)
                    : const Icon(Icons.add),
                SizedBox(width: 8,),
                ((int.parse(_categoryController.idController.text == ''
                                ? '0'
                                : _categoryController.idController.text)) >
                            0
                        ? "修改"
                        : "新增")
                    .toLabel(fontsize: 20),
              ],
            )),
        Expanded(
          child: SfDataGrid(
            columnWidthMode: ColumnWidthMode.fill,
            source: _categoryDataGridSource,
            columns: [
              GridColumn(
                  columnName: 'id',
                  label: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'ID',
                        overflow: TextOverflow.ellipsis,
                      ))),
              GridColumn(
                  columnName: 'name',
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
