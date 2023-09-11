import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/core/extension/text_style_ext.dart';
import 'package:test_assesment/features/presentation/developer_cubit/home_developer_cubit.dart';

class DeveloperGameDetail extends StatefulWidget {
  final int id;
  final String title;
  const DeveloperGameDetail({super.key, required this.id, required this.title});

  @override
  State<DeveloperGameDetail> createState() => _DeveloperGameDetailState();
}

class _DeveloperGameDetailState extends State<DeveloperGameDetail> {
  @override
  void initState() {
    super.initState();
    context.read<DeveloperCubit>().getDetailDeveloperGame(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "-").toBoldText(),
      ),
      body: BlocConsumer<DeveloperCubit, DeveloperState>(
          listener: (context, state) {
        if (state.stateEnum == DeveloperStateStatus.Failure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? "-").toNormalText()));
        }
      }, builder: (context, state){
        return _buildBody(state);
      },),
    );
  }

  Widget _buildBody(DeveloperState state) {
    switch (state.stateEnum) {
      case DeveloperStateStatus.Initial:
        return const SizedBox();
      case DeveloperStateStatus.Loading:
        return const Center(child: CircularProgressIndicator.adaptive());
      case DeveloperStateStatus.Failure:
        return _buildErrorState(context, state.message ?? "");
      case DeveloperStateStatus.Loaded:
        final item = state.developer;
        return SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGameImage(item?.imageBackground!),
                ],
              ),
            ),
          ),
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildErrorState(BuildContext context, String? value){
    return Center(
      child: Column(
            children: [
              Text(value ?? "-").toBoldText(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  maximumSize: const Size(200, 60)
                ),
                onPressed: (){
                context.read<DeveloperCubit>().getDetailDeveloperGame(widget.id);
              }, child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Icon(Icons.replay_outlined),
                const Text("Reload").toBoldText()
              ],))
            ],
          ),
    );
  }

  Widget _buildGameImage(String? imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? "-",
      imageBuilder: (context, imageProvider) => Container(
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
