import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/posts_cubit.dart';
import 'widgets/post_preview_card.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late final ScrollController scrollController;
  late final UserPostsCubit postsCubit;

  @override
  void initState() {
    scrollController = ScrollController()..addListener(listenScroll);
    postsCubit = UserPostsCubit(context.read())..init();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<UserPostsCubit, PostsState>(
        bloc: postsCubit,
        builder: (context, state) {
          return switch (state) {
            PostsLoadedState() => ListView.builder(
                controller: scrollController,
                itemCount: state.postsInfo.data.length,
                prototypeItem: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: PostPreviewCard(
                    postPreview: state.postsInfo.data.first,
                  ),
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: PostPreviewCard(
                      postPreview: state.postsInfo.data[index],
                    ),
                  );
                },
              ),
            _ => const Center(child: CircularProgressIndicator()),
          };
        },
      ),
    );
  }

  Future<void> listenScroll() async {
    final isPageEnd = scrollController.offset + 150 >
        scrollController.position.maxScrollExtent;
  }
}
