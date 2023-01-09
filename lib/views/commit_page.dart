import 'package:flutter/material.dart';
import 'package:github_app/models/commits.dart';
import 'package:github_app/service/base_client.dart';

class CommitPage extends StatefulWidget {
  CommitPage({Key? key, required this.name}) : super(key: key);

  String name;
  @override
  State<CommitPage> createState() => _CommitPageState();
}

class _CommitPageState extends State<CommitPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Commits'),
      ),
      body: FutureBuilder(
        future: BaseClient().getCommits(widget.name),
        builder: (context, AsyncSnapshot<List<Commits?>?> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(snapshot.data![index]!.commit!.message!),
                      subtitle: Text(snapshot.data![index]!.commit!.author!.name!),
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
