import 'dart:convert';
import 'package:bloc_state/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:bloc_state/utils/text_styles.dart';
import 'package:bloc_state/model/item_schema.dart';


Future<List<Item>> fetchData() async{

  const String url = "https://dummyjson.com/users";
  final response = await http.get(Uri.parse(url));
  if(response.statusCode == 200){
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    List<dynamic> usersJson = jsonResponse['users'];

    return usersJson.map((json) => Item.fromJson(json)).toList();
  }else{
    throw Exception('Failed to load item');
  }

}

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  late Future<List<Item>> futureItems;
  final style = TextStyles();

  @override
  void initState() {
    super.initState();
    futureItems = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items List'),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Demo()));
      }, label: const Icon(Icons.abc)),
      body: Center(
        child: FutureBuilder<List<Item>> (
          future: futureItems,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return SizedBox(height: 200,width: 200,child: customContainer(snapshot.data![index].image, snapshot.data![index].firstName, snapshot.data![index].lastName));
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator.adaptive();
          },
        ),
      ),
    );
  }

  Widget customContainer(image,title,subtitle){
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image),fit: BoxFit.contain,scale: 20),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(style: BorderStyle.solid,color: Colors.grey),
      ),
      child: Column(
        children: [
          Text(title,style: style.titleTextStyle,),
          const Spacer(),
          Text(subtitle,style: style.subtitleTextStyle,)
        ],
      ),
    );
  }

}
