/* Objective function */

Min: 622 Xa1 + 614 Xa2 + 630 Xa3 + 641 Xb1 + 645 Xb2 + 649 Xb3;

/* Constraints */

productionA: Xa1 + Xa2 + Xa3 + Xa4 = 100;
productionB: Xb1 + Xb2 + Xb3 + Xb4 = 120;
demand1: Xa1 + Xb1 = 80;
demand2: Xa2 + Xb2 = 60;
demand3: Xa3 + Xb3 = 70;
demand4: Xa4 + Xb4 = 10;