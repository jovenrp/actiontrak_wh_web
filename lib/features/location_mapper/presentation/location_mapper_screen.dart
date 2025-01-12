import 'package:actiontrak_wh/application/models/location_mapper/container_data.dart';
import 'package:actiontrak_wh/application/providers/error_bloc.dart';
import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/appbar/custom_appbar.dart';
import 'package:actiontrak_wh/application/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:actiontrak_wh/application/widgets/buttons/custom_button_container.dart';
import 'package:actiontrak_wh/application/widgets/cards/no_data.dart';
import 'package:actiontrak_wh/application/widgets/loader/spinner_loader.dart';
import 'package:actiontrak_wh/application/widgets/textfields/custom_textfield.dart';
import 'package:actiontrak_wh/features/location_mapper/bloc/location_mapper_bloc.dart';
import 'package:actiontrak_wh/features/location_mapper/bloc/location_mapper_state.dart';
import 'package:actiontrak_wh/features/navigation/presentation/navigation_bar.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:universal_platform/universal_platform.dart';

class LocationMapperScreen extends StatefulWidget {
  const LocationMapperScreen({super.key, this.parentId, this.id, this.status, this.containerData});

  final String? parentId;
  final String? id;
  final String? status;
  final ContainerData? containerData;

  static const String routeName = '/locationMapper';
  static const String screenName = 'locationMapperScreen';

  static ModalRoute<LocationMapperScreen> route({String? parentId, String? id, String? status, ContainerData? containerData}) => MaterialPageRoute<LocationMapperScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => LocationMapperScreen(
          parentId: parentId,
          id: id,
          status: status,
          containerData: containerData,
        ),
      );

  @override
  LocationMapperScreenState createState() => LocationMapperScreenState();
}

class LocationMapperScreenState extends State<LocationMapperScreen> {
  late double width;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<LocationMapperBloc>().getContainers(parentId: widget.parentId, status: widget.status, containerData: widget.containerData);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return BlocConsumer<LocationMapperBloc, LocationMapperState>(listener: (BuildContext context, LocationMapperState state) {
      if (!state.isLoading && state.hasError) {
        context.read<ErrorBloc>().showError(errorMessage: state.errorMessage, errorStatus: state.statusCode);
      }
    }, builder: (BuildContext context, LocationMapperState state) {
      return Scaffold(
        appBar: CustomAppBar(
          title: 'Location Mapper',
          showBackButton: UniversalPlatform.isWeb ? false : true,
          onBackButtonPressed: () {
            Navigator.of(context).pushReplacement(NavigationBottomBar.route());
          },
        ),
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
                    setState(() {
                      //context.read<StockCountBloc>().searchTicket(value: value);
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
                  : state.containerData?.isEmpty == true && state.parentContainerData?.isEmpty == true
                      ? const NoData()
                      : Expanded(
                          child: ListView.separated(
                            //itemCount: widget.status == 'children' ? state.containerData?.length ?? 0 : state.parentContainerData?.length ?? 0,
                            itemCount: state.containerData?.length ?? 0,
                            itemBuilder: (BuildContext context, int i) {
                              return Slidable(
                                  // Specify a key if the Slidable is dismissible.
                                  key: ValueKey('key_$i'),
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {},
                                        backgroundColor: AppColors.calendarBorder,
                                        foregroundColor: Colors.white,
                                        icon: Icons.edit,
                                      ),
                                      SlidableAction(
                                        onPressed: (contexts) {
                                          final formKey = GlobalKey<FormState>();
                                          TextEditingController nameController = TextEditingController();
                                          TextEditingController codeController = TextEditingController();
                                          TextEditingController serialController = TextEditingController();
                                          CustomBottomSheet.show(
                                            contexts,
                                            key: formKey,
                                            title: state.containerData?[i].name,
                                            nameController: nameController,
                                            codeController: codeController,
                                            serialController: serialController,
                                            submit: () {
                                              if (formKey.currentState!.validate()) {
                                                // If the form is valid, do something like submit the data
                                                context.read<LocationMapperBloc>().createContainer(
                                                  id: state.containerData?[i].id,
                                                  name: nameController.text,
                                                  code: codeController.text,
                                                  serialNo: serialController.text,
                                                );
                                                Navigator.pop(context); // Dismiss after submission
                                              }
                                            }
                                          );
                                        },
                                        backgroundColor: AppColors.primaryAccent,
                                        foregroundColor: Colors.white,
                                        icon: Icons.add_business_outlined,
                                      ),
                                    ],
                                  ),
                                  child: CustomButtonContainer(
                                      icons: 'assets/images/png/warehouse.png',
                                      text: state.containerData?[i].name,
                                      subtitle: state.containerData?[i].num,
                                      onPressed: () {
                                        Navigator.of(context).push(LocationMapperScreen.route(
                                          parentId: state.containerData?[i].id,
                                          id: state.containerData?[i].parentId,
                                          status: 'children',
                                          containerData: const ContainerData(),
                                        ));
                                      }));
                              /*return widget.status == 'children' ? CustomButtonContainer(
                                  icons: Icons.holiday_village_outlined,
                                  text: state.containerData?[i].name,
                                  onPressed: () {
                                    Navigator.of(context).push(LocationMapperScreen.route(
                                      parentId: state.containerData?[i].id,
                                      id: state.containerData?[i].parentId,
                                      status: 'children',
                                      containerData: const ContainerData(),
                                    ));
                                  }) : CustomButtonContainer(
                                  icons: Icons.holiday_village_outlined,
                                  text: state.parentContainerData?[i].name,
                                  onPressed: () {
                                    Navigator.of(context).push(LocationMapperScreen.route(
                                      parentId: state.parentContainerData?[i].id,
                                      id: state.parentContainerData?[i].parentId,
                                      status: 'children',
                                      containerData: const ContainerData(),
                                    ));
                                  });*/
                            },
                            separatorBuilder: (BuildContext context, int i) {
                              return const SizedBox(
                                height: 15,
                              );
                            },
                          ),
                        ),
            ],
          ),
        ),
      );
    });
  }
}
