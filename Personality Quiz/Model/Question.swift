//
//  Model.swift
//  Personality Quiz
//
//  Created by Aleksandr on 11/5/22.
//

struct Question {
    var text: String
    var type: ResponceType
    var answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "Какую пищу вы предпочитаете",
                type: .single,
                answers: [
                    Answer(text: "рыба", type: .cat),
                    Answer(text: "Стейк", type: .dog),
                    Answer(text: "Морковь", type: .rabbit),
                    Answer(text: "Зелень", type: .turtle)
                ]
            ),
            Question(
                text: "Что вам нравится больше?",
                type: .multiple,
                answers: [
                    Answer(text: "Плавать", type: .dog),
                    Answer(text: "Спать", type: .cat),
                    Answer(text: "Обниматься", type: .rabbit),
                    Answer(text: "Есть", type: .turtle)
                ]
            ),
            Question(
                text: "Любите ли вы поездки на машине?",
                type: .ranged,
                answers: [
                    Answer(text: "Ненавижу", type: .dog),
                    Answer(text: "Нервничаю", type: .cat),
                    Answer(text: "Не замечаю", type: .rabbit),
                    Answer(text: "Обожаю", type: .turtle)
                ]
            )
        ]
    }
}
