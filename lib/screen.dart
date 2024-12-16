import 'package:flutter/material.dart';
import 'package:my_profile_app/features/Recipe%20Screen/presentation/widgets/custom_recipe/custom_recipe_form.dart';
import 'package:my_profile_app/features/Recipe%20Screen/presentation/widgets/recipe_list.dart';
import 'package:my_profile_app/features/Restaurant/presentation/widgets/components/restaurant_list_ui.dart';
import 'package:my_profile_app/features/Restaurant/presentation/widgets/restaurant_list.dart';
import 'package:my_profile_app/features/crypto_app/presentation/components/crypto_app.dart';
import 'package:my_profile_app/features/crypto_app/presentation/widgets/listtracker.dart';
import 'package:my_profile_app/features/crypto_app/presentation/widgets/movie_list.dart';
import 'package:my_profile_app/features/crypto_app/presentation/widgets/news.dart';
import 'package:my_profile_app/features/pc_profile/controller/user_profile_controller.dart';
import 'package:my_profile_app/features/pc_profile/domain/system_specs_model.dart';
import 'package:my_profile_app/features/pc_profile/domain/user_model.dart';
import 'package:my_profile_app/features/pc_profile/presentation/components/pc_profile.dart';
import 'package:my_profile_app/features/pc_profile/controller/system_specs_controller.dart';
import 'package:my_profile_app/features/profile_app/controller/profile_app_controller.dart';
import 'package:my_profile_app/features/profile_app/domain/post_model.dart';
import 'package:my_profile_app/features/profile_app/domain/profile_model.dart';
import 'package:my_profile_app/features/profile_app/presentation/components/profile_app.dart';
import 'package:my_profile_app/features/wrap.dart';

class Screens extends StatelessWidget {
  const Screens({super.key});

  Widget buildItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget widget,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber,
        ),
        child: Icon(icon),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Obtain profile and posts data
    Profile profile = ProfileAppController.getProfile();
    List<Post> posts = ProfileAppController.getPosts();
    UserProfile userProfile = UserProfileController.getUserProfile();
    SystemSpecs systemSpecs = SystemSpecsController.getSystemSpecs();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildItem(
                context,
                title: "ProfileApp",
                subtitle: "Practice ProfileApp",
                icon: Icons.add,
                widget: ProfileApp(profile: profile, posts: posts),
              ),
              buildItem(
                context,
                title: "PC Profile",
                subtitle: "Dynamic PC Profile",
                icon: Icons.add,
                widget: PcProfile(
                  userProfile: userProfile,
                  systemSpecs: systemSpecs,
                ),
              ),
              buildItem(
                context,
                title: "CryptoApp",
                subtitle: "Crypto Profile",
                icon: Icons.add,
                widget: const CryptoApp(),
              ),
              buildItem(
                context,
                title: "WrapPractice",
                subtitle: "Wrap Practice",
                icon: Icons.add,
                widget: const WrapPractice(),
              ),
              buildItem(
                context,
                title: "list tracker",
                subtitle: "statemanagement Practice",
                icon: Icons.add,
                widget: const ListTracker(),
              ),
              buildItem(
                context,
                title: "Movie List",
                subtitle: "statemanagement Practice",
                icon: Icons.add,
                widget: const MovieList(),
              ),
              buildItem(
                context,
                title: "News List",
                subtitle: "statemanagement Practice",
                icon: Icons.add,
                widget: const NewsScreen(),
              ),
              buildItem(
                context,
                title: "Recipe Screen",
                subtitle: "statemanagement Practice",
                icon: Icons.add,
                widget: const RecipeList(),
              ),
              buildItem(
                context,
                title: "Recipe Screen",
                subtitle: "statemanagement Practice",
                icon: Icons.add,
                widget: const RestaurantListUI(
                  restaurants: [],
                ),
              ),
              buildItem(
                context,
                title: "Restaurant Screen",
                subtitle: "statemanagement Practice",
                icon: Icons.add,
                widget: const RestaurantList(),
              ),
              buildItem(
                context,
                title: "Custom Recipe Screen",
                subtitle: "statemanagement Practice",
                icon: Icons.add,
                widget: const CustomRecipeForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
