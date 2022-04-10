import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mywms/module/category.dart';

import '../utils/http.dart';
import '../widgets/mysnackbar.dart';

class CategoryController extends GetxController {
  late final Dio dio; //HTTP 请求对象
  RxList<Category> dataCategory = <Category>[].obs; // 分类的数据列表
  RxInt id = 0.obs;
  RxBool loading = false.obs;
  Rx<Category> listSelectCategory = Category(0,'','',0).obs;

  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
 // TextEditingController descController = TextEditingController();
  TextEditingController iconController = TextEditingController();

  TextEditingController addTitleController = TextEditingController();
 // TextEditingController addDescController = TextEditingController();
  TextEditingController addIconController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dio = DioSigle().dio;
  }

// 读取分类数据
  void readCategory() async {
    var response = await dio.get('category');
    if (response.statusCode == 200) {
      List jsonResponse = response.data['data'];
      if (jsonResponse.isNotEmpty && jsonResponse.length > 0) {
        dataCategory.value =
            jsonResponse.map((e) => Category.fromJson(e)).toList();
        print(dataCategory.map((e) => e.categoryname));
      }
    } else {
      print('Backend error');
    }
  }

// 新增分类数据
  void addCategory() async {
    var response = await dio.post('category', queryParameters: {
      'categoryname': addTitleController.text,
      'categorypic': addIconController.text,
      'status':0
      //'icon': addIconController.text,
    });
    if (response.statusCode == 200 && response.data['code'] == 200) {
      readCategory();
      addTitleController.clear();
      //addDescController.clear();
      addIconController.clear();
    } else {
      myGetSnackBar(
          title: '警告',
          message: '数据处理异常，请与管理员联系！addCategory',
          icon: Icon(
            Icons.cancel,
            color: Colors.redAccent,
            size: 40,
          ));
    }
  }

// 删除分类数据
  void deleteCategory(int id)async{
    var response = await dio.delete('delete', queryParameters: {
      'id': id.toString(),
    });
      if(response.statusCode==200 ){
        if( response.data['code']==200){
          readCategory();
        }else {
          myGetSnackBar(
              title: '警告',
              message: response.data['msg'],
              icon: Icon(
                Icons.cancel,
                color: Colors.redAccent,
                size: 40,
              ));
        }
      }else{
        myGetSnackBar(
            title: '警告',
            message: response.data['msg'],
            icon: Icon(
              Icons.cancel,
              color: Colors.redAccent,
              size: 40,
            ));
      }
  }

// 查询具体条目
  void selectCategory(int id)async{
    var response = await dio.get('category', queryParameters: {
      'id': id.toString(),
    });
      if(response.statusCode==200 && response.data['code']==200){
        listSelectCategory.value = Category.fromJson(response.data['data']);
      }else{
        myGetSnackBar(
            title: '警告',
            message: '数据处理异常，请与管理员联系！selectCategory',
            icon: Icon(
              Icons.cancel,
              color: Colors.redAccent,
              size: 40,
            ));
      }

  }

//编辑提交具体条目
  void editCategory(int id)async{
    var response = await dio.post('category', queryParameters: {
      'id': id.toString(),
      'categoryname':titleController.text,
      'categorypic':iconController.text,
      'status':0//iconController.text,

    });
      if(response.statusCode==200){
        if(response.data['code']==200){
          readCategory();
          myGetSnackBar(title: '提示',message: '编辑成功！');
          Get.back();
        }
      }else{
        myGetSnackBar(
            title: '警告',
            message: '数据处理异常，请与管理员联系！editCategory',
            icon: Icon(
              Icons.cancel,
              color: Colors.redAccent,
              size: 40,
            ));
      }
  }

}