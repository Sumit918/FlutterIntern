import 'package:my_profile_app/features/crypto_app/controller/async_news_controller.dart';
import 'package:my_profile_app/features/crypto_app/domain/newsmodel.dart';
import 'package:my_profile_app/features/utils/exporter.dart';

final newsProvider = AsyncNotifierProvider<NewsListController, NewsModel>(
    NewsListController.new);
