// for now creating all the models in same file

class WordMeanDataModel {
  String? word;
  List<Meanings>? meanings;

  WordMeanDataModel({this.word, this.meanings});

  WordMeanDataModel.fromJson(Map<String, dynamic> json) {
    word = json['word'];

    if (json['meanings'] != null) {
      meanings = <Meanings>[];
      json['meanings'].forEach((v) {
        meanings!.add(Meanings.fromJson(v));
      });
    }
  }
}

class Meanings {
  String? partOfSpeech;
  List<Definitions>? definitions;

  Meanings({this.partOfSpeech, this.definitions});

  Meanings.fromJson(Map<String, dynamic> json) {
    partOfSpeech = json['partOfSpeech'];
    if (json['definitions'] != null) {
      definitions = <Definitions>[];
      json['definitions'].forEach((v) {
        definitions!.add(Definitions.fromJson(v));
      });
    }
  }
}

class Definitions {
  String? definition;
  String? example;

  Definitions({this.definition, this.example});

  Definitions.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['definition'] = definition;
    data['example'] = example;

    return data;
  }
}
