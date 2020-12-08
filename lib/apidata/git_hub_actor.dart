import 'package:json_annotation/json_annotation.dart';

part 'git_hub_actor.g.dart';

@JsonSerializable()
class Actor{
  @JsonKey(name: "login")
  final String name;

  @JsonKey(name: "avatar_url")
  final String avatarUrl;


  Actor(this.name, this.avatarUrl);

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  Map<String, dynamic> toJson() => _$ActorToJson(this);
}