import 'package:ecommerce_app_design/provider/product_provider.dart';
import 'package:ecommerce_app_design/screens/item_detail_screen.dart';
import 'package:ecommerce_app_design/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/category_tags.dart';
import '../widgets/new_arrival_custom_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        if(provider.getErrorMessage != null){
          return Scaffold(
            body: Center(
              child: Text(provider.getErrorMessage!),
            ),
          );
        }
        if(provider.getProducts.isEmpty){
          provider.fetchProducts();
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(top: 20.0),
                  sliver: SliverAppBar(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/iphone.jpg',
                              ),
                            fit: BoxFit.fill
                          ),
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello,',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: const Color(0xffa1a0a4)
                          ),
                        ),
                        Text('ABC',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    actions: [
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(
                            Icons.notifications
                        ),
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: const Icon(
                              Icons.menu_rounded
                          )
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Search for brand',
                                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: const Color(0xff959598)
                                ),
                                fillColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),)),
                                prefixIcon: const Icon(
                                  Icons.search_rounded,
                                  color: Color(0xff959598),
                                )
                            ),
                          ),
                        ),
                        // Container(
                        //   height: MediaQuery.of(context).size.width/1.5,
                        //   width: MediaQuery.of(context).size.width,
                        //   color: const Color(0xffece3da),
                        // ),
                        const CustomSlider(),
                        SizedBox(
                          height: 65,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.getCategories.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: index == 0 ? 8 : 0.0,
                                    right: index == provider.getCategories.length-1 ? 8 : 0.0,
                                  ),
                                  child: CategoryTags(label: provider.getCategories[index]),
                                );
                              }
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'New Arrival',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: (){},
                                child: Text(
                                  'See All',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 220,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for(int i=0; i<8; i++)
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: i == 0 ? 4.0 : 0.0,
                                      right: i == 7 ? 4.0 : 0.0
                                  ),
                                  child: NewArrivalCustomCard(
                                    title: provider.getProducts[i].title!,
                                    description: provider.getProducts[i].description!,
                                    image: provider.getProducts[i].images![0],
                                    price: provider.getProducts[i].price.toString(),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ItemDetailScreen(
                                              item: provider.getProducts[i],
                                            )
                                        ),
                                      );
                                    },
                                  ),
                                )
                            ],
                          ),
                        ),
                      ]
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

