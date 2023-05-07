import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';
  final Restaurants restaurant;
  const DetailPage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Hero(
          tag: restaurant.pictureId,
          child: Column(
            children: [
              Image.network(restaurant.pictureId),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_pin),
                              Text(restaurant.city),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(restaurant.rating.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                    ),
                    Text('Description'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      restaurant.description,
                      overflow: TextOverflow.clip,
                    ),
                    Divider(
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Menus'),
                          SizedBox(
                            height: 0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Foods'),
                              Column(
                                children: [
                                  Card(
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 120,
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              restaurant.menus.foods.toString(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
