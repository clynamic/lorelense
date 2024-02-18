// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      bio: json['bio'] as String?,
      discord: json['discord'] as String?,
      github: json['github'] as String?,
      pronouns: json['pronouns'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'bio': instance.bio,
      'discord': instance.discord,
      'email': instance.email,
      'github': instance.github,
      'id': instance.id,
      'name': instance.name,
      'pronouns': instance.pronouns,
    };
