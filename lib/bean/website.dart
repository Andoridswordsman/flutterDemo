import 'package:json_annotation/json_annotation.dart'; 
  
part 'website.g.dart';

@JsonSerializable(nullable: false)
  class Website {

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'imagePath')
  String imagePath;

  @JsonKey(name: 'isVisible')
  int isVisible;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'url')
  String url;

  Website(this.desc,this.id,this.imagePath,this.isVisible,this.order,this.title,this.type,this.url,);

  factory Website.fromJson(Map<String, dynamic> srcJson) => _$WebsiteFromJson(srcJson);
  Map<String, dynamic> toJson() => _$WebsiteToJson(this);
}