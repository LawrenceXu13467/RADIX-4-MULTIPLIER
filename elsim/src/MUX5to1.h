#ifndef MUX5to1_H_
#define MUX5to1_H_

#include "Module.h"
#include <iostream>

// Multiplexer
// Z = (A AND NOT SEL) OR (B AND SEL)
//
// N-bit inputs A,B
// 1-bit input SEL
// N-bit output Z

class MUX5to1 : public Module
{
public:
	MUX5to1(int N)
	{
		addInput("A0", N);
		addInput("A1", N);
		addInput("A2", N);
		addInput("ABar", N);
		addInput("A2Bar", N);
		addInput("SEL", 3);

		addOutput("Z", N);

		std::stringstream ss;
		ss << "MUX5to1" << "<" << N << ">";
		classname_ = ss.str();
	}

	void propagate()
	{
		BitVector sel = IN("SEL");

		if (sel == BitVector(3,0) || sel == BitVector(3,4))
			OUT("Z") <= IN("A0");
		else if (sel == BitVector(3,2))
			OUT("Z") <= IN("A1");
		else if (sel == BitVector(3,1))
			OUT("Z") <= IN("A2");
		else if (sel == BitVector(3,5))
			OUT("Z") <= IN("A2Bar");
		else if (sel == BitVector(3,6))
			OUT("Z") <= IN("ABar");
		else
			OUT("Z") <= BitVector(numOutputs()); // undefined bits
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
		return 100*DELAY_AND(2) + DELAY_OR(2);	// fan-in 2
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

#endif // MUX5to1_H_
