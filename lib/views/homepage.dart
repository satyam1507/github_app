import 'package:flutter/material.dart';
import 'package:github_app/models/repo.dart';
import 'package:github_app/service/base_client.dart';
import 'package:github_app/views/commit_page.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Repos'),
      ),
      body:FutureBuilder(
        future: BaseClient().getRepo(),
        builder: (context, AsyncSnapshot<List<Repos?>?> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(snapshot.data![index]!.name!),
                      subtitle: Text(snapshot.data![index]!.description??"No Description"),
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>CommitPage(name: snapshot.data![index]!.name!)));
                     },

                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}