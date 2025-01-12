import 'package:freezed_annotation/freezed_annotation.dart';

part 'container_data.g.dart';

@JsonSerializable()
class ContainerData {
  const ContainerData({
    this.id,
    this.parentId,
    this.isActive,
    this.num,
    this.code,
    this.name,
    this.isRoot,
  });

  factory ContainerData.fromJson(Map<String, dynamic> json) =>
      _$ContainerDataFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerDataToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'parentId')
  final String? parentId;

  @JsonKey(name: 'isActive')
  final String? isActive;

  @JsonKey(name: 'num')
  final String? num;

  @JsonKey(name: 'code')
  final String? code;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'isRoot')
  final String? isRoot;
}
