# AlignmentUtilities

## Setup
```Mathematica
PrependTo[$Path, "~/git/AlignmentUtilities"];
<< AlignmentUtilities`
```

## UnalignmentReport
Reports for two lists of associations their unalignment and misalignment.
* Each association contains an `alignment key` and a `value key`. Other keys are ignored.
* An association of a list is unaligned if the other list contains no association with the same value for the `alignment key`.
* Two associations are misaligned if the value for the `alignment key` matches but the values for the `value key` do not match.

```Mathematica
In[]:= data1 = {
    <|"key" -> "a", "value" -> 1, "label" -> "A"|>,
    <|"key" -> "b", "value" -> 2|>,
    <|"key" -> "c", "value" -> 5|>
};

In[]:= data2 = {
    <|"key" -> "a", "value" -> 1, "label" -> "abc"|>,
    <|"key" -> "b", "value" -> 3|>
};

In[]:= UnalignmentReport[{data1, data2}, "key", "value"]

Out[]= <|"b" -> {{2}, {3}}, "c" -> {{5}, Missing["NotAligned"]}|>
```

## SuggestAlignments
```Mathematica
In[]:= from = {
    <|"WikidataID" -> "Q1", "ExampleOntologyID" -> "a", "Label" -> "universe", "value" -> 123|>,
    <|"WikidataID" -> "Q2", "Label" -> "Earth", "value" -> 444|>
};

In[]:= to = {
    <|"ExampleOntologyID" -> "a", "LabelDE" -> "Universum", "value" -> 123|>,
    <|"ExampleOntologyID" -> "b", "LabelDE" -> "Erde", "value" -> 444|>
};

In[13]:= SuggestAlignments[from, to, "ExampleOntologyID", "value"]

Out[13]= <|"b" -> {<|"LabelDE" -> "Erde", "value" -> 444, "WikidataID" -> "Q2", "Label" -> "Earth"|>}|>
```
