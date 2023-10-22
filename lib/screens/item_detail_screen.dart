import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Center(
              child: Text('Details'),
            ),
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.favorite_border_rounded
                  )
              ),
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      vertical: 32.0
                    ),
                    child: Center(
                      child: Image.asset('assets/images/iphone.jpg',
                        width: 250,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Text(
                            'Iphone',
                        style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Spacer(),
                        Text(
                          '\$399',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'ndencnec ckrnrc krencnrnr dre ckrkcnrkn  ckrndnrednd eknnrnc  cknrknckrn crnckrncn rjnckrncnr crkcnrnfcrj crjfnendie drncirndi3n e3',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: null,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          onPressed: (){},
                          child: Text('Buy now')
                      ),
                    ),
                  )
                ],
              ),
          ),
        ],
      ),
    );
  }
}
