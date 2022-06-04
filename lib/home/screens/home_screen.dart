import 'dart:developer';

import 'package:st_bloc_api_app/home/bloc/home_bloc.dart';
import 'package:st_bloc_api_app/locator.dart';
import 'package:st_bloc_api_app/services/boredService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<HomeBloc>()..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Bloc,GetIt,API',
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              var listView = ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: state.myList.length,
                itemBuilder: (context, i) {
                  final item = state.myList[i];
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name),
                        Text(item.title),
                        Text(item.data.toString()),
                        Text(item.createdAt.toString()),
                        const SizedBox(height: 100.0),
                      ],
                    ),
                  );
                },
              );
              return listView;
            }
            return Container();
          },
        ),
      ),
    );
  }
}
