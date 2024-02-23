import 'package:digitstitch_app/features/digitstitch/presentation/bloc/category/remote/remote_category_bloc.dart';
import 'package:digitstitch_app/features/digitstitch/presentation/bloc/category/remote/remote_category_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RemoteCategoryBloc, RemoteCategoryState>(
        builder: (_, state){
          if(state is RemoteCategoryLoading){
            return const Center(child: CupertinoActivityIndicator(),);
          }
          if(state is RemoteCategoryDone){
            return ListView.builder(
              itemBuilder: (context, index){
                return ListTile(
                  title: Text('$index'),
                );
              },
              itemCount: state.category!.length,

            );
          }
          return const SizedBox();
        },
      )
    );
  }
}
