Needs["AlignmentUtilities`"];

VerificationTest[
    UnalignmentReport[
        {<|"key" -> "a", "value" -> 1|>},
        {<|"key" -> "a", "value" -> 1|>},
        "key",
        "value"
    ],
    <||>
]

VerificationTest[
    UnalignmentReport[
        {<|"key" -> "a", "value" -> 1|>},
        {<|"key" -> "a", "value" -> 2|>},
        "key",
        "value"
    ],
    <|"a" -> {{1}, {2}}|>
]

VerificationTest[
    UnalignmentReport[
        {<|"key" -> "a", "value" -> 1|>},
        {<|"key" -> "a"|>},
        "key",
        "value"
    ],
    <|"a" -> {{1}, {}}|>
]

VerificationTest[
    UnalignmentReport[
        {<|"key" -> "a", "value" -> 1|>},
        {<||>},
        "key",
        "value"
    ],
    <|"a" -> {{1}, Missing["NotAligned"]}|>
]

VerificationTest[
    UnalignmentReport[
        {<|"key" -> "a", "anno" -> "x", "value" -> 1|>},
        {<|"key" -> "a", "anno" -> "x", "value" -> 1|>},
        {"key", "anno"},
        "value"
    ],
    <||>
]

VerificationTest[
    UnalignmentReport[
        {<|"key" -> "a", "anno" -> "x", "value" -> 1|>},
        {<|"key" -> "a", "anno" -> "x", "value" -> 2|>},
        {"key", "anno"},
        "value"
    ],
    <|{"a", "x"} -> {{1}, {2}}|>
]

VerificationTest[
    UnalignmentReport[
        {<|"key" -> "a", "anno" -> "x", "value" -> 1|>},
        {<|"key" -> "a", "anno" -> "y", "value" -> 1|>},
        {"key", "anno"},
        "value"
    ],
    <|
        {"a", "x"} -> {{1}, Missing["NotAligned"]},
        {"a", "y"} -> {Missing["NotAligned"], {1}}
    |>
]

VerificationTest[
    UnalignmentReport[
        {<|"key" -> "a", "anno" -> "x", "value" -> 1|>},
        {<|"key" -> "a", "anno" -> "y", "value" -> 2|>},
        {"key", "anno"},
        "value"
    ],
    <|
        {"a", "x"} -> {{1}, Missing["NotAligned"]},
        {"a", "y"} -> {Missing["NotAligned"], {2}}
    |>
]
