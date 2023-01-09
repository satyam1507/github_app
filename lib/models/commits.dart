import 'dart:convert';

List<Commits?>? commitsFromJson(String str) => json.decode(str) == null ? [] : List<Commits?>.from(json.decode(str)!.map((x) => Commits.fromJson(x)));

class Commits {
    Commits({
        this.nodeId,
        this.commit,
    });

    Commit? commit;
    String? nodeId;


    factory Commits.fromJson(Map<String, dynamic> json) => Commits(
        nodeId: json["node_id"],
        commit: Commit.fromJson(json["commit"]),
    );

    Map<String, dynamic> toJson() => {
        "node_id": nodeId,
        "commit": commit!.toJson(),
    };
}

class Commit {
    Commit({
        this.author,
        this.committer,
        this.message,
        this.url,
        this.commentCount,
    });

    CommitAuthorClass? author;
    CommitAuthorClass? committer;
    String? message;
    String? url;
    int? commentCount;

    factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        author: CommitAuthorClass.fromJson(json["author"]),
        committer: CommitAuthorClass.fromJson(json["committer"]),
        message: json["message"],
        url: json["url"],
        commentCount: json["comment_count"],
    );

    Map<String, dynamic> toJson() => {
        "author": author!.toJson(),
        "committer": committer!.toJson(),
        "message": message,
        "url": url,
        "comment_count": commentCount,
    };
}

class CommitAuthorClass {
    CommitAuthorClass({
        this.name,
        this.email,
    });

    String? name;
    String? email;

    factory CommitAuthorClass.fromJson(Map<String, dynamic> json) => CommitAuthorClass(
        name: json["name"],
        email: json["email"],
        
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
    };
}
