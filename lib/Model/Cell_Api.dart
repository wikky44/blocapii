import 'dart:convert';
import 'dart:html';

import 'package:blocapii/Model/Cell.dart';
import 'package:blocapii/Model/Products.dart';
import 'package:http/http.dart' as http;


class CellApi{
  String endpoint = 'https://dummyjson.com/products';
  Future<List<Products>?> getproducts() async {
    var response = await http.get(Uri.parse(endpoint));
    var ss=jsonDecode(response.body.toString());
    var s=Cell.fromJson(ss);
    var list=s.products;
    return list;

  }

}

