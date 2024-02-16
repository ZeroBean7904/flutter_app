import 'package:json_annotation/json_annotation.dart';

part 'survey2data.g.dart';

@JsonSerializable()
class S2 {
  final String name;
  final String type;
  final String greeting;
  final List<Category> categories;

  S2({required this.name, required this.type,required this.greeting,required this.categories});

  factory S2.fromJson(Map<String,dynamic> json) => _$S2FromJson(json);
  Map<String,dynamic> toJson() => _$S2ToJson(this);
}

@JsonSerializable()
class Category {
  final String name;
  final List<Factor> factors;

  Category({required this.name, required this.factors});

  factory Category.fromJson(Map<String,dynamic> json) => _$CategoryFromJson(json);
  Map<String,dynamic> toJson() => _$CategoryToJson(this); 
}

@JsonSerializable()
class Factor {
  final String name;
  final List<String> questions;

  Factor({required this.name, required this.questions});

  factory Factor.fromJson(Map<String,dynamic> json) => _$FactorFromJson(json);
  Map<String,dynamic> toJson() => _$FactorToJson(this);
}