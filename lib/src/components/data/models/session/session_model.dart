class SessionModel {
  SessionModel({
    required this.username,
    required this.name,
    this.id,
    this.createdAt,
  });

// factory
  SessionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    username = json['username'] as String;
    name = json['name'] as String;
    createdAt = json['created_at'] as String;
  }
  int? id;
  late String username;
  late String name;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['name'] = name;
    return data;
  }

  @override
  String toString() {
    return 'SessionModel(id: $id, username: $username, '
        'name: $name, createdAt: $createdAt)';
  }
}
