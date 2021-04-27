(* ::Package:: *)

BeginPackage["AlignmentUtilities`"];


UnalignmentReport::usage = "UnalignmentReport[{assoc11, ...}, {assoc21, ...}, alignmentKey, valueKey] returns an association whose keys are the values of alignmentKey in the associj and whose values are the complements of values of valueKey.";


Begin["`Private`"];


UnalignmentReport[
    list1 : {___Association},
    list2 : {___Association},
    alignmentKey_,
    valueKey_
] := DeleteCases[
    Module[
        {g1, g2},
        {g1, g2} = GroupBy[
            Select[#, KeyExistsQ[alignmentKey]],
            Key[alignmentKey] -> Key[valueKey],
            DeleteMissing
        ] & /@ {list1, list2};
        {g1, g2} = KeyUnion[
            {g1, g2},
            Missing["NotAligned"] &
        ];
        Merge[
            {g1, g2},
            Apply[Function[{v1, v2},
                If[AnyTrue[{v1, v2}, MissingQ],
                    Replace[
                        {v1, v2},
                        l_List :> DeleteDuplicates[l],
                        {1}
                    ],
                    {Complement[v1, v2], Complement[v2, v1]}
                ]
            ]]
        ]
    ],
    {{}, {}}
];


End[];


EndPackage[];
