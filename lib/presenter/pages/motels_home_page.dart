import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel_list_test/core/di/inject.dart';
import 'package:motel_list_test/domain/repositories/motel_repository.dart';
import 'package:motel_list_test/presenter/cubit/motels_home_cubit.dart';
import 'package:motel_list_test/presenter/widgets/custom_app_bar.dart';
import 'package:motel_list_test/presenter/widgets/motel_listed.dart';

class MotelsHomePage extends StatefulWidget {
  const MotelsHomePage({super.key});

  @override
  State<MotelsHomePage> createState() => _MotelsHomePageState();
}

class _MotelsHomePageState extends State<MotelsHomePage> {
  late final _cubit = MotelsHomeCubit(
    motelRepository: getIt<MotelRepository>(),
  );

  @override
  void initState() {
    super.initState();
    _cubit.fetchMotelData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: CustomAppBar(),
        drawer: Drawer(),
        body: BlocBuilder<MotelsHomeCubit, MotelsHomeState>(
          builder: (context, motelState) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: switch (motelState) {
              MotelsHomeLoading() => Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              MotelsHomeError(:final message) => Center(
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              MotelsHomeLoaded(:final motelResponse) => MotelListed(
                  moteis: motelResponse.data.moteis,
                  motelsHomeCubit: _cubit,
                ),
            },
          ),
        ),
      ),
    );
  }
}
