// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdate _$UserUpdateFromJson(Map<String, dynamic> json) => UserUpdate(
      bio: json['bio'] as String?,
      discord: json['discord'] as String?,
      email: json['email'] as String?,
      github: json['github'] as String?,
      name: json['name'] as String?,
      pronouns: json['pronouns'] as String?,
    );

Map<String, dynamic> _$UserUpdateToJson(UserUpdate instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'discord': instance.discord,
      'email': instance.email,
      'github': instance.github,
      'name': instance.name,
      'pronouns': instance.pronouns,
    };
