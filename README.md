# alignmentchecker

## Setup
```Mathematica
PrependTo[$Path, "~/git/alignmentchecker"];
<< AlignmentChecker`
```

## Example
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

In[]:= UnalignmentReport[data1, data2, "key", "value"]

Out[]= <|"b" -> {{2}, {3}}, "c" -> {{5}, Missing["NotAligned"]}|>
```
