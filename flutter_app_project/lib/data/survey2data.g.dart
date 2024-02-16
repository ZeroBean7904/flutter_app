// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey2data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

S2 _$S2FromJson(Map<String, dynamic> json) => S2(
      name: json['name'] as String,
      type: json['type'] as String,
      greeting: json['greeting'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$S2ToJson(S2 instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'greeting': instance.greeting,
      'categories': instance.categories,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      name: json['name'] as String,
      factors: (json['factors'] as List<dynamic>)
          .map((e) => Factor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name': instance.name,
      'factors': instance.factors,
    };

Factor _$FactorFromJson(Map<String, dynamic> json) => Factor(
      name: json['name'] as String,
      questions:
          (json['questions'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FactorToJson(Factor instance) => <String, dynamic>{
      'name': instance.name,
      'questions': instance.questions,
    };
