import 'package:my_profile_app/features/crypto_app/domain/newsmodel.dart';
import 'package:my_profile_app/features/crypto_app/presentation/components/news_contstant.dart';
import 'package:my_profile_app/features/crypto_app/presentation/state/newsstate.dart';
import 'package:my_profile_app/features/utils/exporter.dart';

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> {
  String selectedCategory = "politics"; // Default selected category
  String selectedCountry = "np"; // Default selected country

  @override
  Widget build(BuildContext context) {
    final newsData = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto News'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(newsProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                    ref.read(newsProvider.notifier).setCategory(value!);
                  },
                  items: categories.map<DropdownMenuItem<String>>((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: selectedCountry,
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value!;
                    });
                    ref.read(newsProvider.notifier).setCountry(value!);
                  },
                  items: countries.map<DropdownMenuItem<String>>((country) {
                    return DropdownMenuItem<String>(
                      value: country,
                      child: Text(country.toUpperCase()),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: newsData.map(
              data: (newsModel) {
                final articles = newsModel.value.results ?? [];
                if (articles.isEmpty) {
                  return const Center(child: Text("No news available."));
                }
                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return NewsListItem(article: article);
                  },
                );
              },
              loading: (AsyncLoading<NewsModel> loading) =>
                  const Center(child: CircularProgressIndicator()),
              error: (error) => Center(
                child: Text(
                  'Failed to load news: ${error.error}',
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsListItem extends StatelessWidget {
  final Result article;

  const NewsListItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: article.imageUrl != null
          ? Image.network(
              article.imageUrl!,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            )
          : const Icon(Icons.image_not_supported, size: 40),
      title: Text(
        article.title ?? "No Title",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.description ?? "No Description",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            article.pubDate != null
                ? "Published: ${article.pubDate!.toLocal()}"
                : "Unknown Date",
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Implement navigation to article detail page or external link
      },
    );
  }
}
