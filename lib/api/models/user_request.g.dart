// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      email: json['email'] as String,
      name: json['name'] as String,
      bio: json['bio'] as String?,
      discord: json['discord'] as String?,
      github: json['github'] as String?,
      pronouns: json['pronouns'] as String?,
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'discord': instance.discord,
      'email': instance.email,
      'github': instance.github,
      'name': instance.name,
      'pronouns': instance.pronouns,
    };
