import 'package:clean_arcitectur_simple/injection.dart';
import 'package:clean_arcitectur_simple/presentation/bloc/comments_list/comments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommentsBloc>(
      create: (context) => CommentsBloc(locator.get())..add(CommentsListInit()),
      child: const CommentsScreen(),
    );
  }
}

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Commnets List')),
        body: BlocBuilder<CommentsBloc, CommentsState>(
          builder: (context, state) {
            if (state is CommentsListInitial) {
              return const Center();
            }

            if (state is CommentsListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CommentsListError) {
              return Center(child: Text(state.message));
            }

            if (state is CommentsListHasData) {
              return ListView.builder(
                itemCount: state.dataComments.length,
                itemBuilder: (context, index) {
                  final item = state.dataComments[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.body),
                  );
                },
              );
            }

            return const Center(
              child: Text('Illegal State'),
            );
          },
        ));
  }
}
