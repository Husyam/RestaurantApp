import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/ui/detail_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant APP'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List restaurantss = parseRestaurant(snapshot.data);
          return ListView.builder(
            itemCount: restaurantss.length,
            itemBuilder: (context, index) {
              return _buildRestaurantIte(context, restaurantss[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildRestaurantIte(BuildContext context, Restaurants restaurants) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: restaurants);
      },
      leading: Image.network(
        restaurants.pictureId,
        width: 100,
        errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error)),
      ),
      title: Text(restaurants.name),
      subtitle: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_pin),
                Text(restaurants.city),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(restaurants.rating.toString()),
              ],
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   padding: EdgeInsets.symmetric(
    //     horizontal: 16,
    //     vertical: 8.0,
    //   ),
    //   child: Row(
    //     children: [
    //       Image.network(
    //         restaurants.pictureId,
    //         width: 100,
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Padding(
    //             padding: EdgeInsets.only(left: 20),
    //           ),
    //           Text(restaurants.name),
    //           Row(
    //             children: [
    //               Icon(Icons.location_on),
    //               Text(restaurants.city),
    //             ],
    //           ),
    //           Row(
    //             children: [
    //               Icon(Icons.star),
    //               Text(restaurants.rating.toString()),
    //             ],
    //           )
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
