import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/core/utils/extentions.dart';
import 'package:skill_swap/core/utils/style.dart';
import 'package:skill_swap/core/widget/button/filled.widget.dart';
import 'package:skill_swap/core/widget/button/outlined.widget.dart';
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

        _provider = ctx.read<HomeProvider>();

        return BodyLayout(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
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
              _provider!.isApiCalling
                  ? Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                      itemCount: _provider!.users.length,

                      itemBuilder: (context, index) {
                        return Placeholder();
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
