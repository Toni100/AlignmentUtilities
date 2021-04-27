Needs["AlignmentUtilities`"];

VerificationTest[
    SuggestAlignments[
        {<|"key" -> "a", "value" -> 1|>},
        {<|"key" -> "a", "value" -> 1|>},
        "key",
        "value"
    ],
    <||>
]

VerificationTest[
    SuggestAlignments[
        {<|"value" -> 1, "label" -> "A"|>, <|"value" -> 1, "label" -> "B"|>},
        {<|"key" -> "a", "value" -> 1|>},
        "key",
        "value"
    ],
    <|"a" -> {<|"value" -> 1, "label" -> "A"|>, <|"value" -> 1, "label" -> "B"|>}|>
]

VerificationTest[
    SuggestAlignments[
        {<|"value" -> 1, "label" -> "A"|>, <|"value" -> 1, "label" -> "B"|>},
        {<|"key" -> "a", "value" -> 1, "label" -> "A"|>},
        "key",
        "value"
    ],
    <|
        "a" -> {
            <|"value" -> 1, {"from", "label"} -> "A", {"to", "label"} -> "A"|>,
            <|"value" -> 1, {"from", "label"} -> "A", {"to", "label"} -> "B"|>
        }
    |>
]
