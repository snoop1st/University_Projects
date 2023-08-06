#include "p3200179-p3200207-res.h"

int atheater[SEATS_ZONEA][N_SEATS], btheater[SEATS_ZONEB][N_SEATS], bank_account, free_tel, free_cashier, count_success, count_fail_seats, count_fail_payment;
pthread_mutex_t tel_mutex, cash_mutex, arr_mutex;
pthread_cond_t cond_free_tel, cond_free_cash;
double total_tel_wait_time, total_cash_wait_time, total_cust_wait_time;
unsigned int seed;
	
int search_seats(int theater[][N_SEATS], int max_rows, int cust_seats, int *r, int *c)
{	
	int i, j, k, start, cont_seats;
	
	for(i = 0; i < max_rows; i++)
	{		
		cont_seats = 0;
		for(j = 0; j < N_SEATS; j++)
		{
			if(theater[i][j] != 0)
				cont_seats = 0;
			else 
			{
				if(cont_seats == 0)
				{
					start = j; // Dhlonei thn proti diathesimi thesi gia na ginei h kratisi.
					if(start + cust_seats > N_SEATS) // Elegxos an iparxoun 
					// diathesimes theseis stin sigkekrimeni seira. An oxi, elegxoume tin epomeni seira.
						break;
				}
				cont_seats++;
			}
			if(cont_seats == cust_seats) // Elegxoume an vrethikan sinexomenes theseis.
			{
				for(k = 0; k < cust_seats; k++)
				{
				 	theater[i][start+k] = 1; // Thetoume to 1 se oles tis theseis pou kratithikan.	
				}
				*r = i; // Apothikeuoume thn grammi.
				*c = start; // Apothikeuoume thn thesh ths prvths krathmenhs theshs.
				return 1;
			}
		}
	}
	count_fail_seats++;
	return 0;
}

int cost_tickets(int zone, int cust_seats)
{ 	
	int cost, card;
	
	card = rand_r(&seed) % 10;
	if(card <= (PROB_CARD_SUC-1))
	{
		if(zone <= 2)
			cost = cust_seats * COST_A;
		else
			cost = cust_seats * COST_B;
	
		bank_account += cost;
		return 1;
	}
	else
		return 0;
}

void* start_routine(void* id)
{
	int i, cust_id, sel_zone, row, start, cont_seats, zone, cust_seats, next_cust_time, tel_time, cash_time, res;
	struct timespec wait_time_start;
	struct timespec wait_time_stop;
	struct timespec pay_time_start;
	struct timespec pay_time_stop;
	struct timespec cust_time_stop;
	
	cust_id = *(int*)id;
	if(cust_id > 1)
	{
		next_cust_time = (rand_r(&seed) % (T_RES_HIGH - T_RES_LOW + 1)) + T_RES_LOW;
		printf("Customer_%d phones after %d seconds\n", cust_id, next_cust_time);
		sleep(next_cust_time);
	}
	else
		printf("Customer_1 phones immediatelly\n");	

	clock_gettime(CLOCK_REALTIME, &wait_time_start);
	zone = rand_r(&seed) % 10; // Epilogh zonhs.

	cust_seats = (rand_r(&seed) % (N_SEAT_HIGH - N_SEAT_LOW + 1)) + N_SEAT_LOW;
	printf("Customer_%d seats = %d\n", cust_id, cust_seats);	
	
	pthread_mutex_lock(&tel_mutex);
	
	
	while(free_tel <= 0) // Perimenoume gia eleuthero thlefoniti.
	{
		printf("TEL *********************\n");
		pthread_cond_wait(&cond_free_tel, &tel_mutex);
	}
	free_tel--;
	
	clock_gettime(CLOCK_REALTIME, &wait_time_stop);
	total_tel_wait_time += wait_time_stop.tv_sec - wait_time_start.tv_sec;
	if(zone <= (PROB_ZONEA-1))
	{
		sel_zone = 1;	
		res = search_seats(atheater, SEATS_ZONEA, cust_seats, &row, &start);
	}
	else
	{
		sel_zone = 2;	
		res = search_seats(btheater, SEATS_ZONEB, cust_seats, &row, &start);
	}
	
	
	pthread_mutex_unlock(&tel_mutex);

	// Perimenoume ton xrono tou tilefoniti.
	tel_time = (rand_r(&seed) % (T_SEAT_HIGH - T_SEAT_LOW + 1)) + T_SEAT_LOW;
	sleep(tel_time);

	// Apeleutheronoume ton tilefoniti.	
	pthread_mutex_lock(&tel_mutex);
	free_tel++;
	clock_gettime(CLOCK_REALTIME, &pay_time_start);
	pthread_cond_signal(&cond_free_tel);	
	pthread_mutex_unlock(&tel_mutex);

	if(res == 1) // Simainei oti vrethikan eleutheres theseis.
	{
		pthread_mutex_lock(&cash_mutex);
		while(free_cashier <= 0) // Perimenoume gia eleuthero tamia.
		{
			printf("CASH *********************\n");
			pthread_cond_wait(&cond_free_cash, &cash_mutex);
		}
		free_cashier--;
		clock_gettime(CLOCK_REALTIME, &pay_time_stop);
		// Ypologizoyme ton synoliko xrono mexri na analabei o tamias
		total_cash_wait_time += pay_time_stop.tv_sec - pay_time_start.tv_sec;
		res = cost_tickets(zone, cust_seats);
		if(res == 1)
		{
			printf("%d seats for customer_%d are reserved succesfully in zone_%d (row_%d and column_%d)\n", cust_seats, cust_id, sel_zone, row+1, start+1);	
			count_success++;
		}
		
		pthread_mutex_unlock(&cash_mutex);

		// Perimenoume ton xrono tou tamia.
		cash_time = (rand_r(&seed) % (T_CASH_HIGH - T_CASH_LOW + 1)) + T_CASH_LOW;
		sleep(cash_time);
		
		if(res == 0) // Simainei oti yphrxe provlima me thn pistotikh.
		{	
			pthread_mutex_lock(&tel_mutex);
			count_fail_payment++;
			for(i = 0; i < cust_seats; i++)
			{
				if(sel_zone == 1)	
			 		atheater[row][start+i] = 0; // Apodesmevoume tis theseis.
				else
			 		btheater[row][start+i] = 0; // Apodesmevoume tis theseis.
			}
			printf("Card declined. %d seats for customer_%d in zone_%d will be returned to the system (row_%d and column_%d)\n", cust_seats, cust_id, sel_zone, row+1, start+1);	
			pthread_mutex_unlock(&tel_mutex);
		}
		
		// Apeleutheronoume ton tamia.
		pthread_mutex_lock(&cash_mutex);
		free_cashier++;
		clock_gettime(CLOCK_REALTIME, &cust_time_stop);
		total_cust_wait_time += cust_time_stop.tv_sec - wait_time_start.tv_sec;
		pthread_cond_signal(&cond_free_cash);	
		pthread_mutex_unlock(&cash_mutex);
	}
	pthread_exit(&cust_id);
}

int main(int argc, char *argv[])
{	
	
	int *ptr;
	int i, j, status, cust;
	
	// Elegxoyme ton arithmo twn parametrwn 
    if (argc != 3) 
	{
		printf("Error: The program must receive 2 arguments: number of customers and seed\n");
		exit(-1);
	}

  // Pairnoyme ton arithmo twn pelatwn
	cust = atoi(argv[1]);
   	if (cust <= 0) 
   	{
		printf("Error: The number of customers should be a positive integer\n");
		exit(-1);
	}
	seed = atoi(argv[2]);
    
    free_tel = N_TEL;
	free_cashier = N_CASH;
	count_success = count_fail_seats = count_fail_payment = 0;
	total_tel_wait_time = total_cash_wait_time = total_cust_wait_time = 0;
		
	for(i = 0; i < SEATS_ZONEA; i++)
		for(j = 0; j < N_SEATS; j++)
			atheater[i][j] = 0;

	for(i = 0; i < SEATS_ZONEB; i++)
		for(j = 0; j < N_SEATS; j++)
			btheater[i][j] = 0;
	
	// Ftiaxnoyme ta nimata
	pthread_t threads[cust];
	
	for(i = 0; i < cust; i++)
	{
		j = i+1;
		status = pthread_create(&threads[i], NULL, start_routine, (void*)&j);
		if(status != 0)
		{
			printf("Error: thread creation\n");
			exit(-1);
		}
		sleep(1);
	}
	// Perimenoume na teleiosoun ta nimata.
	for(i = 0; i < cust; i++)
	{
  		status = pthread_join(threads[i], (void**)&ptr);
		if(status != 0)
		{
			printf("Error: thread join\n");
			exit(-1);
		}
	}
	printf("Total earnings: %d euros\n", bank_account);
	
	printf("Precentage of customers that succeeded is %.2f\n", count_success*100.0/cust);
	printf("Precentage of customers that failed because no seats were available is %.2f\n", count_fail_seats*100.0/cust);
	printf("Precentage of customers that failed because card was declined is %.2f\n", count_fail_payment*100.0/cust);
	
	printf("Average time of customers waiting to get served by tel and cashier %.1f\n", (total_tel_wait_time + total_cash_wait_time)/cust);
	printf("Average call duration time to get served  %.1f\n", total_cust_wait_time/cust);

	return 0;
}

