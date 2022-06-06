import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:light_controller_app/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Welcome>? list;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    var client = http.Client();
    Uri uri = Uri.parse(
      'https://jsonplaceholder.typicode.com/users',
    );
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      list = welcomeFromJson(json);
      debugPrint(list![0].toString());
    }

    if(list != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map Page"),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
            itemCount: list?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(list![index].name),
                    Text(list![index].email),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
