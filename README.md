# cgma
cmga is an amalgamation of the words c (programming language) and sigma. It is not production ready (but if you manage to convince your boss to let you write cgma at work, please let me know), and definetly not meant to be taken seriously.

This is a fork of Austin Z. Henley's teenytinycompiler. I added:
 - pointer operators
 - brainrot keywords

Example code:
```
YAP "How many fibonacci numbers do you want?"
HEAROUT nums
YAP ""

COOK a = 0
COOK b = 1
EDGE nums > 0 STREAK
    YAP a
    COOK c = a + b
    COOK a = b
    COOK b = c
    COOK nums = nums - 1
ENDEDGE
```
