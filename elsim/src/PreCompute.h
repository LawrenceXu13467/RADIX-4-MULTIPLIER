#ifndef PRECOMPUTE_H_
#define PRECOMPUTE_H_

#include "Module.h"
#include<iostream>

// Multiplexer
// Z = (A AND NOT SEL) OR (B AND SEL)
//
// N-bit inputs A,B
// 1-bit input SEL
// N-bit output Z

class PreCompute : public Module
{
public:
	PreCompute(int N)
	{
		addInput("A",N);
		int M = N+2;

		addOutput("A0",M);
		addOutput("A1",M);
		addOutput("A2",M);
		addOutput("ABar",M);
		addOutput("A2Bar",M);

		std::stringstream ss;
		ss << "PreCompute<" << N << ">";
		classname_ = ss.str();
	}

	void propagate()
	{
		BitVector Atemp = IN("A");
		int Np = Atemp.width() + 2;
		BitVector A(Np, Atemp);
		int AValue = A.getValue();
	
		BitVector A0(Np, 0);
		BitVector A1(Np, A);
		BitVector A2 (Np, 2*AValue);
		BitVector ABar (Np, -1*AValue);
		BitVector A2Bar (Np, -2*AValue);

		OUT("A0") <= 0;
		OUT("A1") <= A1;
		OUT("A2") <= A2;
		OUT("ABar") <= ABar;
		OUT("A2Bar") <= A2Bar;
	}

	delay_t delay(int inum, int onum)
	{
		//int N = numOutputs();
		//// only A[i]->Z[i] and B[i]->Z[i] paths exist
		//if (inum < N)
		//{
		//	if (inum != onum) return DELAY_T_MIN;
		//}
		//else
		//{
		//	int tmp = inum - N;
		//	if (tmp < N && tmp != onum) return DELAY_T_MIN;
		//}
		return 100*DELAY_AND(2);	// fan-in 2
	}

	//delay_t load(int inum) const
	//{
	//	int N = numOutputs();
	//	// A,B inputs
	//	if (inum < 2*N) return LOAD_AND;
	//	// SEL input
	//	return N*2*LOAD_AND;
	//}

	//area_t area() const
	//{
	//	return numOutputs() * (2*AREA_AND(2) + AREA_OR(2));	// fan-in 2
	//}

	//energy_t energy(int onum) const
	//{
	//	return 2*2*ENERGY_AND + 2*ENERGY_OR;
	//}
};

#endif // PRECOMPUTE_H_
