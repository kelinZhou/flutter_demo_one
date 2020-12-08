import 'package:json_annotation/json_annotation.dart';

part 'git_hub_repo.g.dart';

@JsonSerializable()
class Repo{
  final String name;
  final String url;

  Repo(this.name, this.url);


  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);

  Map<String, dynamic> toJson() => _$RepoToJson(this);
}