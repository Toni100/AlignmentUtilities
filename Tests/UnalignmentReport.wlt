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
