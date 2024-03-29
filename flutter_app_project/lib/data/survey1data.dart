import 'package:json_annotation/json_annotation.dart';

part 'survey1data.g.dart';

@JsonSerializable()
class S1 {
  final String name;
  final String type;
  final String greeting;
  final List<Category> categories;

  S1({required this.name, required this.type,required this.greeting,required this.categories});

  factory S1.fromJson(Map<String,dynamic> json) => _$S1FromJson(json);
  Map<String,dynamic> toJson() => _$S1ToJson(this);
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