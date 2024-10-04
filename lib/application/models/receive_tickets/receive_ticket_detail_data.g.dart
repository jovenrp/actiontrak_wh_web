// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_ticket_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveTicketDetailsData _$ReceiveTicketDetailsDataFromJson(
        Map<String, dynamic> json) =>
    ReceiveTicketDetailsData(
      id: json['id'] as String?,
      lineNum: json['lineNum'] as String?,
      status: json['status'] as String?,
      containerId: json['containerId'] as String?,
      containerCode: json['containerCode'] as String?,
      itemId: json['itemId'] as String?,
      sku: json['sku'] as String?,
      itemNum: json['itemNum'] as String?,
      itemName: json['itemName'] as String?,
      userId: json['userId'] as String?,
      loginName: json['loginName'] as String?,
      fullName: json['fullName'] as String?,
      lotNum: json['lotNum'] as String?,
      isLotTracked: json['isLotTracked'] as String?,
      isComplete: json['isComplete'] as String?,
      isUnder: json['isUnder'] as String?,
      isOver: json['isOver'] as String?,
      qtyReceived: json['qtyRcvd'] as String?,
      qtyOrder: json['qtyOrd'] as String?,
      uom: json['uom'] as String?,
      qtyUnit: json['qtyUnit'] as String?,
      isChecked: json['isChecked'] as bool? ?? false,
      isFiltered: json['isFiltered'] as bool? ?? false,
      isVisible: json['isVisible'] as bool? ?? false,
      pickedItem: json['pickedItem'] as String?,
    );

Map<String, dynamic> _$ReceiveTicketDetailsDataToJson(
        ReceiveTicketDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lineNum': instance.lineNum,
      'status': instance.status,
      'containerId': instance.containerId,
      'containerCode': instance.containerCode,
      'itemId': instance.itemId,
      'sku': instance.sku,
      'itemNum': instance.itemNum,
      'itemName': instance.itemName,
      'userId': instance.userId,
      'loginName': instance.loginName,
      'fullName': instance.fullName,
      'lotNum': instance.lotNum,
      'isLotTracked': instance.isLotTracked,
      'isComplete': instance.isComplete,
      'isUnder': instance.isUnder,
      'isOver': instance.isOver,
      'qtyRcvd': instance.qtyReceived,
      'qtyOrd': instance.qtyOrder,
      'uom': instance.uom,
      'qtyUnit': instance.qtyUnit,
      'isChecked': instance.isChecked,
      'isFiltered': instance.isFiltered,
      'isVisible': instance.isVisible,
      'pickedItem': instance.pickedItem,
    };
