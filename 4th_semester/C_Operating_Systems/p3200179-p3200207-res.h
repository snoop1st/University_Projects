#include <stdio.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdlib.h>
#include <unistd.h>

#define N_TEL 			3
#define N_CASH			2

#define N_SEATS 		10
#define SEATS_ZONEA 	10
#define SEATS_ZONEB 	20

#define PROB_ZONEA		3

#define COST_A 			30
#define COST_B 			20

#define N_SEAT_LOW		1
#define N_SEAT_HIGH		5

#define T_RES_LOW 		1
#define T_RES_HIGH		5

#define T_SEAT_LOW 		5
#define T_SEAT_HIGH		13

#define T_CASH_LOW 		4
#define T_CASH_HIGH		8

#define PROB_CARD_SUC	9
