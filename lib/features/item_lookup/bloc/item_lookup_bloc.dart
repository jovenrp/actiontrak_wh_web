import 'dart:convert';

import 'package:actiontrak_wh/application/models/item_lookup/item_alias_data.dart';
import 'package:actiontrak_wh/application/models/item_lookup/item_lookup_response.dart';
import 'package:actiontrak_wh/application/models/item_lookup/item_stock_data.dart';
import 'package:actiontrak_wh/application/models/item_lookup/item_trak_data.dart';
import 'package:actiontrak_wh/application/services/api/url_string.dart';
import 'package:actiontrak_wh/application/services/dio/dio_methods.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'item_lookup_state.dart';

class ItemLookupBloc extends Cubit<ItemLookupState> {
  ItemLookupBloc() : super(ItemLookupState());


  Future<void> init() async {
    emit(state.copyWith(
        isInit: true,
        isLoading: false,
        itemAlias: <ItemAliasData>[],
        itemStock: <ItemStockData>[],
        itemTrak: <ItemTrakData>[]));
  }

  Future<void> searchItem({String? searchItem, String? alias}) async {
    emit(state.copyWith(isLoading: true));

    try {
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.lookupItemAlias(token: token, alias: alias),
      );

      if (response.statusCode == 200) {
        ItemLookupResponse itemLookupResponse = ItemLookupResponse.fromJson(jsonDecode(response.data));

        String searchText = searchItem?.toLowerCase() ?? '';
        List<ItemAliasData> values =
            itemLookupResponse.itemAlias?.where((ItemAliasData item) {
              String id = item.id?.toLowerCase() ?? '';
              String itemId = item.itemId?.toLowerCase() ?? '';
              String itemName = item.itemName?.toLowerCase() ?? '';
              String type = item.type?.toLowerCase() ?? '';
              String note = item.note?.toLowerCase() ?? '';
              String code = item.code?.toLowerCase() ?? '';
              String vendorId = item.code?.toLowerCase() ?? '';
              String vendorName = item.code?.toLowerCase() ?? '';
              return id.contains(searchText) ||
                  itemId.contains((searchText)) ||
                  itemName.contains((searchText)) ||
                  type.contains((searchText)) ||
                  note.contains((searchText)) ||
                  vendorId.contains((searchText)) ||
                  vendorName.contains((searchText)) ||
                  code.contains(searchText);
            }).toList() ??
                <ItemAliasData>[];

        emit(state.copyWith(isLoading: false, itemAlias: searchItem?.isEmpty == true ? itemLookupResponse.itemAlias : values,));
      } else {
        emit(state.copyWith(isLoading: false, itemAlias: []));
      }
    } catch (err) {
      emit(state.copyWith(isLoading: false, itemAlias: []));
    }
  }

  Future<List<ItemAliasData>?> lookupItemAlias({String? alias}) async {
    emit(state.copyWith(isLoading: true));

    try {
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.lookupItemAlias(token: token, alias: alias),
      );

      if (response.statusCode == 200) {
        ItemLookupResponse itemLookupResponse = ItemLookupResponse.fromJson(jsonDecode(response.data));

        emit(state.copyWith(isLoading: false, itemAlias: itemLookupResponse.itemAlias ?? []));
        return itemLookupResponse.itemAlias ?? [];
      } else {
        emit(state.copyWith(isLoading: false, itemAlias: [], hasError: true,  errorMessage: 'Something went wrong.\nStatus <${response.statusCode}>', statusCode: response.statusCode.toString(), ));
        return [];
      }
    } catch (err) {
      emit(state.copyWith(isLoading: false, itemAlias: [], hasError: true,  errorMessage: 'Something went wrong.', statusCode: '500'));
      return [];
    }
  }

  Future<void> lookupBarcodeStock({String? item}) async {
    emit(state.copyWith(isStockLoading: true)); //turn on loading indicator

    try {
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.getItemStockList(token: token, itemId: item),
      );

      if (response.statusCode == 200) {
        ItemLookupResponse itemLookupResponse = ItemLookupResponse.fromJson(jsonDecode(response.data));

        emit(state.copyWith(isLoading: false, itemStock: itemLookupResponse.itemStock ?? []));
      } else {
        emit(state.copyWith(isLoading: false,  hasError: true, itemStock: []));
      }
    } catch (err) {
      emit(state.copyWith(isLoading: false,  hasError: true, itemStock: []));
    }

  }

  Future<void> getItemTrakList({String? item}) async {
    emit(state.copyWith(isTrakLoading: true)); //turn on loading indicator

    try {
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.getItemTrakList(token: token, itemId: item),
      );

      if (response.statusCode == 200) {
        ItemLookupResponse itemLookupResponse = ItemLookupResponse.fromJson(jsonDecode(response.data));

        emit(state.copyWith(isLoading: false, itemTrak: itemLookupResponse.itemTrak ?? []));
      } else {
        emit(state.copyWith(isLoading: false,  hasError: true, itemTrak: []));
      }
    } catch (err) {
      emit(state.copyWith(isLoading: false,  hasError: true, itemTrak: []));
    }
  }
}
