import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/core/extension/text_style_ext.dart';
import 'package:test_assesment/features/presentation/detail_cubit/detail_game_cubit.dart';

class DetailGamePage extends StatefulWidget {
  final int gameId;
  final String? title;
  const DetailGamePage({super.key, required this.gameId, this.title});

  @override
  State<DetailGamePage> createState() => _DetailGamePageState();
}

class _DetailGamePageState extends State<DetailGamePage> {
  @override
  void initState() {
    super.initState();
    context.read<DetailGameCubit>().getDetailGame(widget.gameId);
  }

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<DetailGameCubit, DetailGameState>(
        listener: (context, state) {
          if(state is DetailGameFailure){
            
          }
        },
        builder: (conext, state) {
           return Scaffold(
            appBar: AppBar(title: Text(widget.title ?? "-").toBoldText(),),
           bottomNavigationBar: Container(
            height: 100,
            decoration: BoxDecoration(
              
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(140, 45)
                ),
                onPressed: (){}, child: Text("Buy Now").toBoldText())
            ],),
           ),
      body: switch(state){
            DetailGameInitial() => const SizedBox(),
            DetailGameLoading() => const Center(child: CircularProgressIndicator.adaptive(),),
            DetailGameFailure error => Center(child: Text(error.message),),
            DetailGameLoaded(detailGame: var item) => SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   CachedNetworkImage(imageUrl: item.backgroundImage ?? "-",
                     imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            height: 210,
                                            
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                   ),
                   const SizedBox(height: 10,),
                   Row(children: [
                    CachedNetworkImage(imageUrl: item.backgroundImageAdditional ?? "-",
                     imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                   ),
                   SizedBox(width: 5,),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(item.name ?? "-").toBoldText(),
                    Text(item.updated?.toIso8601String() ?? "-").toSemiBoldText(color: Colors.grey),
                   ],)
                   ],),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 0.2, color: Colors.grey)
                      ),
                      child: Row(children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                                   border: Border(right: BorderSide(width: 0.4, color: Colors.grey))
                          ),
                          child: Column(
                            children: [
                                Row(
                                        children: [
                                         const Icon(
                                            Icons.star_rate_rounded,
                                            color: Colors.amberAccent,
                                          ),
                                        const  SizedBox(
                                            width: 5,
                                          ),
                                          Text(item.rating.toString())
                                              .toSemiBoldText( fontSize: 12),
                                        ],
                                      ),
                                       Row(
                                        children: [
                                        Text(item.ratingTop.toString() + "M").toBoldText(color: Colors.grey, fontSize: 12),
                                        const  SizedBox(
                                            width: 5,
                                          ),
                                          Text("Reviews")
                                              .toBoldText(color: Colors.grey, fontSize: 12),
                                        ],
                                      )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                                   border: Border(right: BorderSide(width: 0.4, color: Colors.grey))
                          ),
                          child: Column(
                            children: [
                                Row(
                                        children: [
                                         const Icon(
                                            Icons.personal_video_outlined,
                                            color: Colors.greenAccent,
                                          ),
                                        const  SizedBox(
                                            width: 5,
                                          ),
                                          Text(item.platforms?.firstOrNull?.platform?.name ?? "-")
                                              .toSemiBoldText( fontSize: 12),
                                        ],
                                      ),
                                    Text("Platform")
                                              .toBoldText(color: Colors.grey, fontSize: 12),
                            ],
                          ),
                        ),
                        
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          
                          child: Column(
                            children: [
                                Row(
                                        children: [
                                         const Icon(
                                            Icons.data_thresholding,
                                            color: Colors.red,
                                          ),
                                        const  SizedBox(
                                            width: 5,
                                          ),
                                          Text(item.updated?.year.toString() ?? '-')
                                              .toSemiBoldText(),
                                        ],
                                      ),
                                      Text("Upadated")
                                              .toBoldText(color: Colors.grey, fontSize: 12),
                            ],
                          ),
                        ),
                        
                      ],),
                    ),
                     SizedBox(height: 20,),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Overview").toBoldText(),
                         Text(item.description ?? '-').toLightText()
                      ],
                     )
                  ],),
                ),
              ),
            )
          } 
    );
        },
      );
   
  }
}
