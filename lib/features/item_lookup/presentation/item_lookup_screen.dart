import 'package:actiontrak_wh/application/models/item_lookup/item_alias_data.dart';
import 'package:actiontrak_wh/application/models/item_lookup/item_stock_data.dart';
import 'package:actiontrak_wh/application/models/item_lookup/item_trak_data.dart';
import 'package:actiontrak_wh/application/providers/error_bloc.dart';
import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/appbar/custom_appbar.dart';
import 'package:actiontrak_wh/application/widgets/cards/item_alias_card.dart';
import 'package:actiontrak_wh/application/widgets/cards/no_data.dart';
import 'package:actiontrak_wh/application/widgets/dividers/custom_dividers.dart';
import 'package:actiontrak_wh/application/widgets/loader/spinner_loader.dart';
import 'package:actiontrak_wh/application/widgets/tables/custom_alias_row.dart';
import 'package:actiontrak_wh/application/widgets/textfields/custom_textfield.dart';
import 'package:actiontrak_wh/features/item_lookup/bloc/item_lookup_bloc.dart';
import 'package:actiontrak_wh/features/item_lookup/bloc/item_lookup_state.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';

class ItemLookupScreen extends StatefulWidget {
  const ItemLookupScreen({super.key});

  static const String routeName = '/itemLookup';
  static const String screenName = 'itemLookupScreen';

  static ModalRoute<ItemLookupScreen> route() => MaterialPageRoute<ItemLookupScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ItemLookupScreen(),
      );

  @override
  ItemLookupScreenState createState() => ItemLookupScreenState();
}

class ItemLookupScreenState extends State<ItemLookupScreen> {
  late double width;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<ItemLookupBloc>().init();
    searchController.text = '857928006702';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return BlocConsumer<ItemLookupBloc, ItemLookupState>(
        listener: (BuildContext context, ItemLookupState state) {
          if (!state.isLoading && state.hasError) {
            context.read<ErrorBloc>().showError(errorMessage: state.errorMessage, errorStatus: state.statusCode);
          }
        },
        builder: (BuildContext context, ItemLookupState state) {
          return Scaffold(
            appBar: CustomAppBar(title: 'Item Look Up', showBackButton: UniversalPlatform.isWeb ? false : true),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CustomTextField(
                    hintText: 'Search',
                    icon: Icons.search,
                    controller: searchController,
                    onChanged: (value) {
                      EasyDebounce.debounce('debounce', const Duration(milliseconds: 700), () {
                        context.read<ItemLookupBloc>().lookupItemAlias(alias: searchController.text).then((List<ItemAliasData>? itemAlias) {
                          //context.read<ItemLookupBloc>().lookupBarcodeStock(item: '4611');
                          if (context.mounted) {
                            context.read<ItemLookupBloc>().lookupBarcodeStock(item: itemAlias?.first.itemId);
                            context.read<ItemLookupBloc>().getItemTrakList(item: itemAlias?.first.itemId);
                          }
                        });
                      });
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  state.isLoading
                      ? const Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: SpinnerLoader(),
                        )
                      : state.itemAlias?.isEmpty == true
                          ? const NoData()
                          : SingleChildScrollView(
                              child: Column(
                                children: getAllContents(alias: state.itemAlias ?? [], stock: state.itemStock, trak: state.itemTrak),
                              ),
                            ),
                ],
              ),
            ),
          );
        });
  }

  List<Widget> getAllContents({List<ItemAliasData>? alias, List<ItemStockData>? stock, List<ItemTrakData>? trak}) {
    List<Widget> content = [];
    List<Widget> aliasContent = [];
    List<Widget> trakContent = [];

    Widget headerWidget = ItemAliasCard(
      itemId: alias?.first.itemId ?? '',
      itemName: alias?.first.itemName ?? '',
      itemNum: alias?.first.itemNum ?? '',
      sku: alias?.first.sku ?? '',
      type: alias?.first.type ?? '',
      code: alias?.first.code ?? '',
      note: alias?.first.note ?? '',
    );
    content.add(headerWidget);
    content.add(const SizedBox(
      height: 20,
    ));

    if (alias?.isNotEmpty == true) {
      Widget aliasHeaderWidget = const CustomAliasRow(
        itemId: '',
        itemName: '',
        itemNum: '',
        sku: '',
        type: 'CODE',
        code: 'ALIAS',
        note: '',
        isHeader: true,
      );
      aliasContent.add(aliasHeaderWidget);
    }

    aliasContent.add(const Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: CustomDividers(
        color: AppColors.disabledButton,
      ),
    ));

    for (ItemAliasData item in alias ?? []) {
      Widget aliasWidget = CustomAliasRow(
        itemId: item.itemId ?? '',
        itemName: item.itemName ?? '',
        itemNum: item.itemNum ?? '',
        sku: item.sku ?? '',
        type: item.type ?? '',
        code: item.code ?? '',
        note: item.note ?? '',
      );
      aliasContent.add(aliasWidget);
    }

    if (trak?.isNotEmpty == true) {
      Widget aliasHeaderWidget = const CustomAliasRow(
        itemId: '',
        itemName: '',
        itemNum: '',
        sku: '',
        type: 'NUM',
        code: 'TRAK LOCATIONS',
        note: '',
        isHeader: true,
      );
      trakContent.add(aliasHeaderWidget);
    }

    trakContent.add(const Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: CustomDividers(
        color: AppColors.disabledButton,
      ),
    ));

    for (ItemTrakData item in trak ?? []) {
      Widget aliasWidget = CustomAliasRow(
        itemId: '',
        itemName: '',
        itemNum: '',
        sku: '',
        type: item.containerNum ?? '',
        code: item.containerCode ?? '',
        note: '',
      );
      trakContent.add(aliasWidget);
    }

    Widget aliasContentContainer = alias?.isNotEmpty == true ? Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: AppColors.surface),
      child: Column(
        children: aliasContent,
      ),
    ) : const SizedBox.shrink();

    Widget trakContentContainer = trak?.isNotEmpty == true ? Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: AppColors.surface),
      child: Column(
        children: trakContent,
      ),
    ) : const SizedBox.shrink();

    content.add(aliasContentContainer);
    content.add(const SizedBox(
      height: 20,
    ));
    content.add(trakContentContainer);

    return content;
  }
}
