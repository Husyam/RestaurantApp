import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

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
          final List<Restaurants> Restaurantss = parseRestaurant(snapshot.data);
          return ListView.builder(
            itemCount: Restaurantss.length,
            itemBuilder: (context, index) {
              return _buildRestaurantIte(context, Restaurantss[index]);
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
      leading: Image.network(
        restaurants.pictureId,
        width: 100,
        errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error)),
      ),
      title: Text(restaurants.name),
      subtitle: Text(restaurants.description),
    );
  }
}
