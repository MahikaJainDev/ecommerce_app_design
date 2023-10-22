import 'package:ecommerce_app_design/provider/product_provider.dart';
import 'package:ecommerce_app_design/screens/item_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                          color: Colors.purple,
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
                                fillColor: const Color(0xffe5e5ea),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(color: Color(0xffe5e5ea))),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(color: Color(0xffe5e5ea)),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(color: Color(0xffe5e5ea))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(color: Color(0xffe5e5ea))),
                                prefixIcon: const Icon(
                                  Icons.search_rounded,
                                  color: Color(0xff959598),
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width/1.5,
                          width: MediaQuery.of(context).size.width,
                          color: const Color(0xffece3da),
                        ),
                        SizedBox(
                          height: 65,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categoryList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: index == 0 ? 8 : 0.0,
                                    right: index == categoryList.length-1 ? 8 : 0.0,
                                  ),
                                  child: CategoryTags(label: categoryList[index]),
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
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, i) => Padding(
                                padding: EdgeInsets.only(
                                    left: i == 0 ? 4.0 : 0.0,
                                    right: i == 9 ? 4.0 : 0.0
                                ),
                                child: NewArrivalCustomCard(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ItemDetailScreen()
                                      ),
                                    );
                                  },
                                ),
                              )),
                        )
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

class CategoryTags extends StatelessWidget {
  const CategoryTags({super.key, required this.label});
  final String label;

  final bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 4.0,
        vertical: 16.0
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: isSelected ? Colors.black : const Color(0xffe5e5ea)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Center(
            child: Text(
                label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xff959598),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewArrivalCustomCard extends StatelessWidget {
  const NewArrivalCustomCard({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          width: 150.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)
            ),
          ),
          child: Card(
            //color: Colors.white,
            elevation: 1.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Center(
                    child: Image.asset('assets/images/iphone.jpg',
                    height: 80.0,
                      width: 80.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text('Iphone pro',
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text('A magical new way to interact with iphone..',
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text('\$999',
                      style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.add_box
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



final List<String> categoryList = const [
  'All Product',
  'Smartphone',
  'Wearable',
  'Camera'
];


