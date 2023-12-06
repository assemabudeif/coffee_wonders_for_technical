import 'package:coffee_wonders_for_technical/features/home/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/resources/strings_manager.dart';
import 'widgets/finished_service_success_view.dart';

class FinishedServiceView extends StatelessWidget {
  const FinishedServiceView({super.key, required this.serviceId});
  final String serviceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.finished),
      ),
      body: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit()..getAllServicesParts(),
        child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = HomeCubit.get(context);
              switch (state.runtimeType) {
                case const (GetAllPartsLoadingState):
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case (const (GetAllPartsLoadedState) ||
                      const (ChangeSelectedPartLoadedState) ||
                      const (ChangeSelectedPartLoadingState)):
                  return FinishedServiceSuccessView(
                    allPartsModel: cubit.allPartsModel,
                    serviceId: serviceId,
                  );
                case const (GetAllPartsErrorState):
                  return Center(
                    child: Text(
                      (state as GetAllPartsErrorState).message,
                    ),
                  );
                default:
                  return Container();
              }
            }),
      ),
    );
  }
}
