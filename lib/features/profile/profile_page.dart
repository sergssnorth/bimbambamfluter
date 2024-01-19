import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/remote_data_sources/models/user_preview.dart';
import '../../data/remote_data_sources/post/post_data_source.dart';
import '../home/bloc/posts_cubit.dart';
import '../home/widgets/post_preview_card.dart';
import '../profile/widgets/profile_info.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late final PostDataSource profileDataSource;
  late final ScrollController scrollController;
  late final UserPostsCubit postsCubit;
  String firstname = "...";
  late UserPreview user;
  String imageUrls = "";

  @override
  void initState() {
    scrollController = ScrollController()..addListener(listenScroll);
    postsCubit = UserPostsCubit(context.read())..init();
    profileDataSource = context.read<PostDataSource>();
    super.initState();
    init();
  }

  Future<void> init() async {
    String userId = '65a9a63d52c5e80be266c14e';
    final usersInfo = await profileDataSource.getUserInfo(userId);
    firstname = usersInfo.firstName;
    setState(() {});
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
        body: Column(
          children: [
            ProfileInformation(
              imageUrls: imageUrls,
              firstName: firstname,
            ),
            SizedBox(
              height: 650.0,
              child: BlocBuilder<UserPostsCubit, PostsState>(
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
            ),
          ],
        )
    );
  }

  Future<void> listenScroll() async {
    final isPageEnd = scrollController.offset + 150 >
        scrollController.position.maxScrollExtent;
  }
}
