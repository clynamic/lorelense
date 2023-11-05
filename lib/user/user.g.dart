// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      pronouns: json['pronouns'] as String?,
      bio: json['bio'] as String?,
      discord: json['discord'] as String?,
      github: json['github'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'pronouns': instance.pronouns,
      'bio': instance.bio,
      'discord': instance.discord,
      'github': instance.github,
    };
