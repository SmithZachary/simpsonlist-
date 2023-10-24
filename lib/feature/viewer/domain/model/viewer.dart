class Viewer {
  String? abstract;
  String? abstractSource;
  String? abstractText;
  String? abstractURL;
  String? answer;
  String? answerType;
  String? definition;
  String? definitionSource;
  String? definitionURL;
  String? entity;
  String? heading;
  String? image;
  int? imageHeight;
  int? imageIsLogo;
  int? imageWidth;
  String? infobox;
  String? redirect;
  List<RelatedTopics>? relatedTopics;
  List<dynamic>? results;
  String? type;

  Viewer({
    this.abstract,
    this.abstractSource,
    this.abstractText,
    this.abstractURL,
    this.answer,
    this.answerType,
    this.definition,
    this.definitionSource,
    this.definitionURL,
    this.entity,
    this.heading,
    this.image,
    this.imageHeight,
    this.imageIsLogo,
    this.imageWidth,
    this.infobox,
    this.redirect,
    this.relatedTopics,
    this.results,
    this.type,
  });

  Viewer.fromJson(Map<String, dynamic> json) {
    abstract = json['Abstract'];
    abstractSource = json['AbstractSource'];
    abstractText = json['AbstractText'];
    abstractURL = json['AbstractURL'];
    answer = json['Answer'];
    answerType = json['AnswerType'];
    definition = json['Definition'];
    definitionSource = json['DefinitionSource'];
    definitionURL = json['DefinitionURL'];
    entity = json['Entity'];
    heading = json['Heading'];
    image = json['Image'];
    imageHeight = json['ImageHeight'];
    imageIsLogo = json['ImageIsLogo'];
    imageWidth = json['ImageWidth'];
    infobox = json['Infobox'];
    redirect = json['Redirect'];
    if (json['RelatedTopics'] != null) {
      relatedTopics = <RelatedTopics>[];
      json['RelatedTopics'].forEach((v) {
        relatedTopics!.add(RelatedTopics.fromJson(v));
      });
    }
    if (json['Results'] != null) {
      results = <Null>[];
      json['Results'].forEach((v) {
        results!.add(v);
      });
    }
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Abstract'] = abstract;
    data['AbstractSource'] = abstractSource;
    data['AbstractText'] = abstractText;
    data['AbstractURL'] = abstractURL;
    data['Answer'] = answer;
    data['AnswerType'] = answerType;
    data['Definition'] = definition;
    data['DefinitionSource'] = definitionSource;
    data['DefinitionURL'] = definitionURL;
    data['Entity'] = entity;
    data['Heading'] = heading;
    data['Image'] = image;
    data['ImageHeight'] = imageHeight;
    data['ImageIsLogo'] = imageIsLogo;
    data['ImageWidth'] = imageWidth;
    data['Infobox'] = infobox;
    data['Redirect'] = redirect;
    if (relatedTopics != null) {
      data['RelatedTopics'] = relatedTopics!.map((v) => v.toJson()).toList();
    }
    if (results != null) {
      data['Results'] = results!.map((v) => v.toJson()).toList();
    }
    data['Type'] = type;
    return data;
  }
}

class RelatedTopics {
  String? firstURL;
  Icon? icon;
  String? result;
  String? text;

  RelatedTopics({this.firstURL, this.icon, this.result, this.text});

  RelatedTopics.fromJson(Map<String, dynamic> json) {
    firstURL = json['FirstURL'];
    icon = json['Icon'] != null ? Icon.fromJson(json['Icon']) : null;
    result = json['Result'];
    text = json['Text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FirstURL'] = firstURL;
    if (icon != null) {
      data['Icon'] = icon!.toJson();
    }
    data['Result'] = result;
    data['Text'] = text;
    return data;
  }
}

class Icon {
  String? height;
  String? uRL;
  String? width;

  Icon({this.height, this.uRL, this.width});

  Icon.fromJson(Map<String, dynamic> json) {
    height = json['Height'];
    uRL = json['URL'];
    width = json['Width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Height'] = height;
    data['URL'] = uRL;
    data['Width'] = width;
    return data;
  }
}

class SrcOptions {
  String? directory;
  int? isFanon;
  int? isMediawiki;
  int? isWikipedia;
  String? language;
  String? minAbstractLength;
  int? skipAbstract;
  int? skipAbstractParen;
  String? skipEnd;
  int? skipIcon;
  int? skipImageName;
  String? skipQr;
  String? sourceSkip;
  String? srcInfo;

  SrcOptions(
      {this.directory,
      this.isFanon,
      this.isMediawiki,
      this.isWikipedia,
      this.language,
      this.minAbstractLength,
      this.skipAbstract,
      this.skipAbstractParen,
      this.skipEnd,
      this.skipIcon,
      this.skipImageName,
      this.skipQr,
      this.sourceSkip,
      this.srcInfo});

  SrcOptions.fromJson(Map<String, dynamic> json) {
    directory = json['directory'];
    isFanon = json['is_fanon'];
    isMediawiki = json['is_mediawiki'];
    isWikipedia = json['is_wikipedia'];
    language = json['language'];
    minAbstractLength = json['min_abstract_length'];
    skipAbstract = json['skip_abstract'];
    skipAbstractParen = json['skip_abstract_paren'];
    skipEnd = json['skip_end'];
    skipIcon = json['skip_icon'];
    skipImageName = json['skip_image_name'];
    skipQr = json['skip_qr'];
    sourceSkip = json['source_skip'];
    srcInfo = json['src_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['directory'] = directory;
    data['is_fanon'] = isFanon;
    data['is_mediawiki'] = isMediawiki;
    data['is_wikipedia'] = isWikipedia;
    data['language'] = language;
    data['min_abstract_length'] = minAbstractLength;
    data['skip_abstract'] = skipAbstract;
    data['skip_abstract_paren'] = skipAbstractParen;
    data['skip_end'] = skipEnd;
    data['skip_icon'] = skipIcon;
    data['skip_image_name'] = skipImageName;
    data['skip_qr'] = skipQr;
    data['source_skip'] = sourceSkip;
    data['src_info'] = srcInfo;
    return data;
  }
}
