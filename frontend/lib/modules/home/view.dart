import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/core/model/skil.model.dart';
import 'package:skill_swap/core/model/user.model.dart';
import 'package:skill_swap/core/utils/extentions.dart';
import 'package:skill_swap/core/utils/style.dart';
import 'package:skill_swap/core/widget/button/filled.widget.dart';
import 'package:skill_swap/core/widget/button/outlined.widget.dart';
import 'package:skill_swap/core/widget/button/pagination.widget.dart';
import 'package:skill_swap/core/widget/components/input.dart';
import 'package:skill_swap/core/widget/layout/body.layout.dart';
import 'package:skill_swap/modules/home/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchTextController = TextEditingController();
  HomeProvider? _provider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      _provider?.fetchInitalData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(context: context),
      builder: (ctx, _) {
        ctx.select<HomeProvider, bool>((HomeProvider provider) {
          return provider.isApiCalling;
        });

        final HomeProvider provider = _provider = ctx.read<HomeProvider>();

        return BodyLayout(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AxOutlinedButton(
                        onPressed: () {},
                        label: null,
                        child: Row(
                          children: [
                            if (!context.isMobile)
                              Text(
                                "Avabilty",
                                style: AxButtonStyle.outlinedTextStyle,
                              ),
                            Icon(Icons.filter_alt),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      SizedBox(
                        width: 400.0,
                        child: InputField(
                          controller: _searchTextController,
                          hintText: "Search",
                        ),
                      ),
                    ],
                  ),
                ),
                provider.isApiCalling
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                      child : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              children: getProfleTiles(users: provider.users)
                            ),
                            const SizedBox(height: 20.0,),
                            PaginationWidget(
                              currentPage: 2,
                              totalPages: 10, 
                              onPageChanged: (int i) {}
                              )
                          ],
                        ),
                      ),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> getProfleTiles({required List<AxUserModel> users}) {
    List<Widget>  children = [];

    for(AxUserModel user in users) {
      if(children.isNotEmpty) {
        children.add(const  SizedBox(height: 16.0));
      }

      final int? roundRating = double.tryParse(user.rating ?? "")?.round();
      String ratingStar = "";
      if(roundRating != null) {
          for(int i =0; i < roundRating;i ++) {
            ratingStar = "$ratingStar ⭐";
          }
      }


      children.add(
        Container(
          decoration: AxStyle.cardDecoration.copyWith(
            boxShadow: []
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: Image.network(
                            "https://images.unsplash.com/photo-1654110455429-cf322b40a906?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fHww"                  
                          ).image ,
                          radius: 60,
                        ),
                        if(user.rating != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(user.rating!,
                            style: AxStyle.secondaryTextStyle.copyWith(
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                        if(ratingStar.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(ratingStar),
                          )
                      
                    
                      ],
                    ),
                    const SizedBox(width: 16.0),
                    Flexible(
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  user.name!,
                                  style: AxStyle.secondaryTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0
                                  ),
                                ),
                              ),
                              _skillWidget(title: "Skils Offerd",skills: user.skillsOffered),
                              const SizedBox(height: 12.0),
                              _skillWidget(title: "Skils Want",skills: user.skillsOffered),
                          
                            ],
                          ),
              
                        ],
                      ),
                    ),
            
                      
                  ],
                
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: AxFilledButton(
                    label: "Request",
                    onPressed: () {}
                  ),
                )
              ],
            ),
          ),
        )
      );
    }

    return children;
  }

  Widget _skillWidget({required title,required List<AxSkillModel> skills}) {
    return Wrap(
      spacing: 5.0,
      runSpacing: 3.0,
      runAlignment: WrapAlignment.center,
      children: [
        Text("$title :",style: TextStyle(color: Colors.green), ),
        if(skills.isEmpty)
          Text("No Skills Availbale")
        else
          ...skills.map((skil) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(12.0)
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 1.0
              ),
              child: Text(skil.name!,
              style: TextStyle(color: AxStyle.white,fontSize: 12.0),),
            );
          })
      ],
    );
  }
}
