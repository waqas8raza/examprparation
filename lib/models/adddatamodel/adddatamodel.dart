
class Question {
    String? id;
    String? title;
    String? classname;
    String? subject;
    String? chapter;
    String? mcqsq;
    List<Options>? options;
    String? answer;

    Question({this.id, this.title, this.classname,this.subject, this.chapter, this.mcqsq, this.options, this.answer});

    Question.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
        classname = json["classname"];
        subject = json["subject"];
        chapter = json["chapter"];
        mcqsq = json["mcqsq"];
        options = json["options"] == null ? null : (json["options"] as List).map((e) => Options.fromJson(e)).toList();
        answer = json["answer"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["id"] = id;
        data["title"] = title;
        data["classname"] = classname;
        data["subject"] = subject;
        data["chapter"] = chapter;
        data["mcqsq"] = mcqsq;
        if(options != null) {
            data["options"] = options?.map((e) => e.toJson()).toList();
        }
        data["answer"] = answer;
        return data;
    }
}

class Options {
    String? optionText;
    bool? isCorrect;

    Options({this.optionText, this.isCorrect});

    Options.fromJson(Map<String, dynamic> json) {
        optionText = json["optionText"];
        isCorrect = json["isCorrect"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["optionText"] = optionText;
        data["isCorrect"] = isCorrect;
        return data;
    }
}