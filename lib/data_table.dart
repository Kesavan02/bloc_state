import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyDataTable extends StatefulWidget {
  const MyDataTable({super.key});

  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {

  late Future<List<dynamic>> futureItems;
  Map<String, dynamic> item = {};
  List<dynamic> users = [];

  Future<List<dynamic>> fetchData() async {
  
    const String url = "https://dummyjson.com/users";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      Map<String, dynamic> item = json.decode(response.body);
      List<dynamic> jsonListItems = item['users'];
      return jsonListItems;
    }else{
      throw Exception('Failed to load item');
    }

}

  @override
  void initState() {
    futureItems = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureItems, 
      builder: (context, snapshot){
      if(snapshot.hasData && snapshot.data != null){
        users = snapshot.data!;
        return Container(
      decoration: const BoxDecoration(
        color: Colors.grey
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.pop(context);
        }),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable(
                headingRowColor: const WidgetStatePropertyAll(Colors.grey),
                decoration: const BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://i.pinimg.com/736x/27/a0/6d/27a06d19477bce560b6c6f42dcf22503.jpg'),fit: BoxFit.cover,opacity: 0.5),
                ),
                border: TableBorder.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  borderRadius: BorderRadius.circular(12.0)
                  ),
                columns: <DataColumn>[
                DataColumn(label: Row(children: [
                  const Text('Name'),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.all_inclusive_rounded))
                ],),),
                DataColumn(label: Text('LastName')),
                DataColumn(label: Text('maidenName')),
                DataColumn(label: Text('Gender')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Phone')),
                DataColumn(label: Text('UserName')),
                DataColumn(label: Text('Password')),
                DataColumn(label: Text('BloodGroup')),
                DataColumn(label: Text('EyeColor')),
                DataColumn(label: Text('Hair Color'))
              ], rows: users.map((user){
                return DataRow(cells: <DataCell>[
                  DataCell(Text(user['firstName'] ?? '')),
                  DataCell(Text(user['lastName'] ?? '')),
                  DataCell(Text(user['maidenName']=="" ? 'null' : user['maidenName'])),
                  DataCell(Text(user['gender'] ?? '')),
                  DataCell(Text(user['email'] ?? '')),
                  DataCell(Text(user['phone'] ?? '')),
                  DataCell(Text(user['username'] ?? '')),
                  DataCell(Text(user['password'] ?? '')),
                  DataCell(Text(user['bloodGroup'] ?? '')),
                  DataCell(Text(user['eyeColor'] ?? '')),
                  DataCell(Text(user['hair']['color'] ?? '')),
                ]);
              }).toList(),),
            ),
          ),
        ),
      ),
    );
      }else if(snapshot.hasError){
        return Center(
          child: Text('${snapshot.error}'),
        );
      }else if(snapshot.connectionState == ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator.adaptive()); 
      } 
      return const Center(child: Text('Error')); 
    });
  }
}
