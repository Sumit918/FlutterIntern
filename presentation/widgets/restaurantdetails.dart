
// class RestaurantDetailScreen extends StatelessWidget {
//   final RestaurantModel restaurant;

//   const RestaurantDetailScreen({Key? key, required this.restaurant})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(restaurant.name),
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               restaurant.name,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             // Text(
//             //   restaurant.description,
//             //   style: const TextStyle(
//             //     fontSize: 16,
//             //   ),
//             // ),
//             // const SizedBox(height: 20),
//             // Text(
//             //   'Address: ${restaurant.address}',
//             //   style: const TextStyle(
//             //     fontSize: 16,
//             //   ),
//             // ),
//             // const SizedBox(height: 10),
//             // Text(
//             //   'Rating: ${restaurant.rating}',
//             //   style: const TextStyle(
//             //     fontSize: 16,
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//       backgroundColor: const Color.fromARGB(255, 188, 188, 188),
//     );
//   }
// }
