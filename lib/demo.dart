import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Item{

  final int id;
  final String firstName;
  final String lastName;

  Item({required this.id, required this.firstName, required this.lastName});

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(id: json['id'], firstName: json['firstName'], lastName: json['lastName']); 
  }
}

Future<List<Item>> fetchData() async {

  const String url = 'https://dummyjson.com/users';
  final response = await http.get(Uri.parse(url));
  if(response.statusCode == 200){
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    List<dynamic> jsonData = jsonResponse['users'];
    return jsonData.map((data) => Item.fromJson(data)).toList();
  }else{
    throw Exception('Failed loading of data');
  }

}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}