// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmLoginModel _$ConfirmLoginModelFromJson(Map<String, dynamic> json) {
  return ConfirmLoginModel(
    accessToken: json['access_token'] as String,
    refreshToken: json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$ConfirmLoginModelToJson(ConfirmLoginModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
