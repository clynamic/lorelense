// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      bio: json['bio'] as String?,
      discord: json['discord'] as String?,
      email: json['email'] as String,
      github: json['github'] as String?,
      id: json['id'] as int,
      name: json['name'] as String,
      pronouns: json['pronouns'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'bio': instance.bio,
      'discord': instance.discord,
      'email': instance.email,
      'github': instance.github,
      'id': instance.id,
      'name': instance.name,
      'pronouns': instance.pronouns,
    };
