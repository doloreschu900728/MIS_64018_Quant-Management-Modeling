/* Objective function */

Max: 5 X12 + 3 X13 + 2 X25 + 3 X35 + 4 X24 + X46 + 4 X47 + 6 X57 + 2 X58 + 7 X89 + 4 X79 + 5 X69;

/* Constraints */

X12 + X13 = 1;
X13 - X35 = 0;
X12 - X25 - X24 = 0;
X25 + X35 - X58 - X57 = 0;
X24 - X47 - X46 = 0;
X58 - X89 = 0;
X57 + X47 - X79 = 0;
X46 - X69 = 0;
X89 + X79 + X69 = 1;

int X12, X13, X25, X35, X24, X46, X47, X57, X58, X89, X79, X69;