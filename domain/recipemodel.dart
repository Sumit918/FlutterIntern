// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

List<RecipeModel> recipeModelsFromJson(String str) => List<RecipeModel>.from(
    json.decode(str).map((x) => RecipeModel.fromJson(x)));

String recipeModelsToJson(List<RecipeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecipeModel {
  final bool? vegetarian;
  final bool? vegan;
  final bool? glutenFree;
  final bool? dairyFree;
  final bool? veryHealthy;
  final bool? cheap;
  final bool? veryPopular;
  final bool? sustainable;
  final bool? lowFodmap;
  final int? weightWatcherSmartPoints;
  final String? gaps;
  final int? preparationMinutes;
  final int? cookingMinutes;
  final int? aggregateLikes;
  final int? healthScore;
  final String? creditsText;
  final String? license;
  final String? sourceName;
  final double? pricePerServing;
  final List<ExtendedIngredient>? extendedIngredients;
  final int? id;
  final String? title;
  final int? readyInMinutes;
  final int? servings;
  final String? sourceUrl;
  final String? image;
  final String? imageType;
  final String? summary;
  final List<dynamic>? cuisines;
  final List<String>? dishTypes;
  final List<dynamic>? diets;
  final List<dynamic>? occasions;
  final String? instructions;
  final List<dynamic>? analyzedInstructions;
  final dynamic originalId;
  final double? spoonacularScore;
  final String? spoonacularSourceUrl;

  RecipeModel({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularScore,
    this.spoonacularSourceUrl,
  });

  RecipeModel copyWith({
    bool? vegetarian,
    bool? vegan,
    bool? glutenFree,
    bool? dairyFree,
    bool? veryHealthy,
    bool? cheap,
    bool? veryPopular,
    bool? sustainable,
    bool? lowFodmap,
    int? weightWatcherSmartPoints,
    String? gaps,
    int? preparationMinutes,
    int? cookingMinutes,
    int? aggregateLikes,
    int? healthScore,
    String? creditsText,
    String? license,
    String? sourceName,
    double? pricePerServing,
    List<ExtendedIngredient>? extendedIngredients,
    int? id,
    String? title,
    int? readyInMinutes,
    int? servings,
    String? sourceUrl,
    String? image,
    String? imageType,
    String? summary,
    List<dynamic>? cuisines,
    List<String>? dishTypes,
    List<dynamic>? diets,
    List<dynamic>? occasions,
    String? instructions,
    List<dynamic>? analyzedInstructions,
    dynamic originalId,
    double? spoonacularScore,
    String? spoonacularSourceUrl,
  }) =>
      RecipeModel(
        vegetarian: vegetarian ?? this.vegetarian,
        vegan: vegan ?? this.vegan,
        glutenFree: glutenFree ?? this.glutenFree,
        dairyFree: dairyFree ?? this.dairyFree,
        veryHealthy: veryHealthy ?? this.veryHealthy,
        cheap: cheap ?? this.cheap,
        veryPopular: veryPopular ?? this.veryPopular,
        sustainable: sustainable ?? this.sustainable,
        lowFodmap: lowFodmap ?? this.lowFodmap,
        weightWatcherSmartPoints:
            weightWatcherSmartPoints ?? this.weightWatcherSmartPoints,
        gaps: gaps ?? this.gaps,
        preparationMinutes: preparationMinutes ?? this.preparationMinutes,
        cookingMinutes: cookingMinutes ?? this.cookingMinutes,
        aggregateLikes: aggregateLikes ?? this.aggregateLikes,
        healthScore: healthScore ?? this.healthScore,
        creditsText: creditsText ?? this.creditsText,
        license: license ?? this.license,
        sourceName: sourceName ?? this.sourceName,
        pricePerServing: pricePerServing ?? this.pricePerServing,
        extendedIngredients: extendedIngredients ?? this.extendedIngredients,
        id: id ?? this.id,
        title: title ?? this.title,
        readyInMinutes: readyInMinutes ?? this.readyInMinutes,
        servings: servings ?? this.servings,
        sourceUrl: sourceUrl ?? this.sourceUrl,
        image: image ?? this.image,
        imageType: imageType ?? this.imageType,
        summary: summary ?? this.summary,
        cuisines: cuisines ?? this.cuisines,
        dishTypes: dishTypes ?? this.dishTypes,
        diets: diets ?? this.diets,
        occasions: occasions ?? this.occasions,
        instructions: instructions ?? this.instructions,
        analyzedInstructions: analyzedInstructions ?? this.analyzedInstructions,
        originalId: originalId ?? this.originalId,
        spoonacularScore: spoonacularScore ?? this.spoonacularScore,
        spoonacularSourceUrl: spoonacularSourceUrl ?? this.spoonacularSourceUrl,
      );

  factory RecipeModel.fromRawJson(String str) =>
      RecipeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        vegetarian: json["vegetarian"],
        vegan: json["vegan"],
        glutenFree: json["glutenFree"],
        dairyFree: json["dairyFree"],
        veryHealthy: json["veryHealthy"],
        cheap: json["cheap"],
        veryPopular: json["veryPopular"],
        sustainable: json["sustainable"],
        lowFodmap: json["lowFodmap"],
        weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
        gaps: json["gaps"],
        preparationMinutes: json["preparationMinutes"],
        cookingMinutes: json["cookingMinutes"],
        aggregateLikes: json["aggregateLikes"],
        healthScore: json["healthScore"],
        creditsText: json["creditsText"],
        license: json["license"],
        sourceName: json["sourceName"],
        pricePerServing: json["pricePerServing"]?.toDouble(),
        extendedIngredients: json["extendedIngredients"] == null
            ? []
            : List<ExtendedIngredient>.from(json["extendedIngredients"]!
                .map((x) => ExtendedIngredient.fromJson(x))),
        id: json["id"],
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        servings: json["servings"],
        sourceUrl: json["sourceUrl"],
        image: json["image"],
        imageType: json["imageType"],
        summary: json["summary"],
        cuisines: json["cuisines"] == null
            ? []
            : List<dynamic>.from(json["cuisines"]!.map((x) => x)),
        dishTypes: json["dishTypes"] == null
            ? []
            : List<String>.from(json["dishTypes"]!.map((x) => x)),
        diets: json["diets"] == null
            ? []
            : List<dynamic>.from(json["diets"]!.map((x) => x)),
        occasions: json["occasions"] == null
            ? []
            : List<dynamic>.from(json["occasions"]!.map((x) => x)),
        instructions: json["instructions"],
        analyzedInstructions: json["analyzedInstructions"] == null
            ? []
            : List<dynamic>.from(json["analyzedInstructions"]!.map((x) => x)),
        originalId: json["originalId"],
        spoonacularScore: json["spoonacularScore"]?.toDouble(),
        spoonacularSourceUrl: json["spoonacularSourceUrl"],
      );

  get imageUrl => null;

  Map<String, dynamic> toJson() => {
        "vegetarian": vegetarian,
        "vegan": vegan,
        "glutenFree": glutenFree,
        "dairyFree": dairyFree,
        "veryHealthy": veryHealthy,
        "cheap": cheap,
        "veryPopular": veryPopular,
        "sustainable": sustainable,
        "lowFodmap": lowFodmap,
        "weightWatcherSmartPoints": weightWatcherSmartPoints,
        "gaps": gaps,
        "preparationMinutes": preparationMinutes,
        "cookingMinutes": cookingMinutes,
        "aggregateLikes": aggregateLikes,
        "healthScore": healthScore,
        "creditsText": creditsText,
        "license": license,
        "sourceName": sourceName,
        "pricePerServing": pricePerServing,
        "extendedIngredients": extendedIngredients == null
            ? []
            : List<dynamic>.from(extendedIngredients!.map((x) => x.toJson())),
        "id": id,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "sourceUrl": sourceUrl,
        "image": image,
        "imageType": imageType,
        "summary": summary,
        "cuisines":
            cuisines == null ? [] : List<dynamic>.from(cuisines!.map((x) => x)),
        "dishTypes": dishTypes == null
            ? []
            : List<dynamic>.from(dishTypes!.map((x) => x)),
        "diets": diets == null ? [] : List<dynamic>.from(diets!.map((x) => x)),
        "occasions": occasions == null
            ? []
            : List<dynamic>.from(occasions!.map((x) => x)),
        "instructions": instructions,
        "analyzedInstructions": analyzedInstructions == null
            ? []
            : List<dynamic>.from(analyzedInstructions!.map((x) => x)),
        "originalId": originalId,
        "spoonacularScore": spoonacularScore,
        "spoonacularSourceUrl": spoonacularSourceUrl,
      };
}

class ExtendedIngredient {
  final int? id;
  final String? aisle;
  final String? image;
  final Consistency? consistency;
  final String? name;
  final String? nameClean;
  final String? original;
  final String? originalName;
  final double? amount;
  final String? unit;
  final List<String>? meta;
  final Measures? measures;

  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.measures,
  });

  ExtendedIngredient copyWith({
    int? id,
    String? aisle,
    String? image,
    Consistency? consistency,
    String? name,
    String? nameClean,
    String? original,
    String? originalName,
    double? amount,
    String? unit,
    List<String>? meta,
    Measures? measures,
  }) =>
      ExtendedIngredient(
        id: id ?? this.id,
        aisle: aisle ?? this.aisle,
        image: image ?? this.image,
        consistency: consistency ?? this.consistency,
        name: name ?? this.name,
        nameClean: nameClean ?? this.nameClean,
        original: original ?? this.original,
        originalName: originalName ?? this.originalName,
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
        meta: meta ?? this.meta,
        measures: measures ?? this.measures,
      );

  factory ExtendedIngredient.fromRawJson(String str) =>
      ExtendedIngredient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      ExtendedIngredient(
        id: json["id"],
        aisle: json["aisle"],
        image: json["image"],
        consistency: consistencyValues.map[json["consistency"]]!,
        name: json["name"],
        nameClean: json["nameClean"],
        original: json["original"],
        originalName: json["originalName"],
        amount: json["amount"]?.toDouble(),
        unit: json["unit"],
        meta: json["meta"] == null
            ? []
            : List<String>.from(json["meta"]!.map((x) => x)),
        measures: json["measures"] == null
            ? null
            : Measures.fromJson(json["measures"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "aisle": aisle,
        "image": image,
        "consistency": consistencyValues.reverse[consistency],
        "name": name,
        "nameClean": nameClean,
        "original": original,
        "originalName": originalName,
        "amount": amount,
        "unit": unit,
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "measures": measures?.toJson(),
      };
}

enum Consistency { LIQUID, SOLID }

final consistencyValues =
    EnumValues({"LIQUID": Consistency.LIQUID, "SOLID": Consistency.SOLID});

class Measures {
  final Metric? us;
  final Metric? metric;

  Measures({
    this.us,
    this.metric,
  });

  Measures copyWith({
    Metric? us,
    Metric? metric,
  }) =>
      Measures(
        us: us ?? this.us,
        metric: metric ?? this.metric,
      );

  factory Measures.fromRawJson(String str) =>
      Measures.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
        us: json["us"] == null ? null : Metric.fromJson(json["us"]),
        metric: json["metric"] == null ? null : Metric.fromJson(json["metric"]),
      );

  Map<String, dynamic> toJson() => {
        "us": us?.toJson(),
        "metric": metric?.toJson(),
      };
}

class Metric {
  final double? amount;
  final String? unitShort;
  final String? unitLong;

  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  Metric copyWith({
    double? amount,
    String? unitShort,
    String? unitLong,
  }) =>
      Metric(
        amount: amount ?? this.amount,
        unitShort: unitShort ?? this.unitShort,
        unitLong: unitLong ?? this.unitLong,
      );

  factory Metric.fromRawJson(String str) => Metric.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
        amount: json["amount"]?.toDouble(),
        unitShort: json["unitShort"],
        unitLong: json["unitLong"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "unitShort": unitShort,
        "unitLong": unitLong,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
