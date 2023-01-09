import 'package:github_app/models/repo.dart';
import 'package:http/http.dart' as http;

import '../models/commits.dart';

class BaseClient {
  var client = http.Client();

  Future<List<Repos?>?> getRepo() async {
    var url = 'https://api.github.com/users/freeCodeCamp/repos';
    var response = await client.get(Uri.parse(url));
    var repos = reposFromJson(response.body);
    return repos;
  }

  Future<List<Commits?>?> getCommits(String repo,) async {
    var url = 'https://api.github.com/repos/freeCodeCamp/$repo/commits';
    var response = await client.get(Uri.parse(url));
    return commitsFromJson(response.body);
  }
}
