// import 'package:blocapiyt/data/models/post_model.dart';
// import 'package:blocapiyt/logic/cubits/post_cubit/post_cubit.dart';
// import 'package:blocapiyt/logic/cubits/post_cubit/post_state.dart';
// import 'package:blocapiyt/presentation/screens/counter.dart';
import 'package:bloc_app/data/models/post_model.dart';
import 'package:bloc_app/logic/cubits/post_cubit/post_cubit.dart';
import 'package:bloc_app/logic/cubits/post_cubit/post_state.dart';
import 'package:bloc_app/presentation/screens/counter.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text("API Handling"),
        actions: [
          MaterialButton(
            color: Colors.amber,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Counter()));
            },
            child: Text("Next"),
          )
        ],
      ),
      body: SafeArea(
        child: BlocConsumer<PostCubit, PostState>(
          listener: (context, state) {
            if (state is PostErrorState) {
              SnackBar snackBar = SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is PostLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is PostLoadedState) {
              return buildPostListView(state.posts);
            }

            return Center(
              child: Text("An error occured!"),
            );
          },
        ),
      ),
    );
  }

  Widget buildPostListView(List<PostModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        PostModel post = posts[index];

        return ListTile(
          title: Text(post.title.toString()),
          subtitle: Text(post.body.toString()),
        );
      },
    );
  }
}
