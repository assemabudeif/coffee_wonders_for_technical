import 'dart:developer';

import 'package:coffee_wonders_for_technical/core/resources/constants_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/resources/strings_manager.dart';
import '/features/home/views/widgets/home_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/resources/color_manager.dart';
import '../view_model/home_cubit.dart';
import 'widgets/home_drawer_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.home,
        ),
        actions: [
          IconButton(
            onPressed: () {
              log(AppConstants.appLanguage);
            },
            icon: const Icon(
              Icons.language,
              // color: ColorManager.white,
            ),
          ),
        ],
      ),
      drawer: const HomeDrawerView(),
      body: BlocProvider(
        create: (context) => HomeCubit()..getAllServiceRequests(context),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (HomeLoadingState):
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case const (HomeErrorState):
                return Center(
                  child: Text(
                    (state as HomeErrorState).message.toString(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorManager.error,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                );
              case const (HomeLoadedState):
                final model = HomeCubit.get(context).allServiceRequestsModel;
                return HomeSuccessView(model: model);
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
