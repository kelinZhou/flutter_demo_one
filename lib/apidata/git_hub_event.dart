import 'package:flutter_demo_one/apidata/git_hub_actor.dart';
import 'package:flutter_demo_one/apidata/git_hub_repo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'git_hub_event.g.dart';

@JsonSerializable()
class GitHubEvent {
  final String id;
  final Actor actor;
  final Repo repo;


  GitHubEvent(this.id, this.actor, this.repo);

  factory GitHubEvent.fromJson(Map<String, dynamic> json) => _$GitHubEventFromJson(json);

  Map<String, dynamic> toJson() => _$GitHubEventToJson(this);
}
