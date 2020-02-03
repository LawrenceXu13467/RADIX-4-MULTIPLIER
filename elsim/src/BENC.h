#ifndef BENC_H_
#define BENC_H_

#include "Module.h"

// Multiplexer
// Z = (A AND NOT SEL) OR (B AND SEL)
//
// N-bit inputs A,B
// 1-bit input SEL
// N-bit output Z

class BENC : public Module
{
public:
	BENC(int N=1)
	{
		addInput("B0",N);
		addInput("B1",N);
		addInput("B2",N);

		addOutput("Y0",N);
		addOutput("Y1",N);
		addOutput("Y2",N);

		std::stringstream ss;
		ss << "BENC<" << N << ">";
		classname_ = ss.str();
	}

	void propagate()
	{
		Bit b0 = IN("B0");
		Bit b1 = IN("B1");
		Bit b2 = IN("B2");

		Bit b1_xor_b0 = (b1 ^ b0);
		Bit b2_xnor_b1 = ~(b2 ^ b1);

		OUT("Y0") <= ~(b1_xor_b0 | b2_xnor_b1);
		OUT("Y1") <= b1_xor_b0;
		OUT("Y2") <= (b2);
	}

	delay_t delay(int inum, int onum)
	{
		int N = numOutputs();
		// only A[i]->Z[i] and B[i]->Z[i] paths exist
		if (inum < N)
		{
			if (inum != onum) return DELAY_T_MIN;
		}
		else
		{
			int tmp = inum - N;
			if (tmp < N && tmp != onum) return DELAY_T_MIN;
		}
		return DELAY_AND(2) + DELAY_OR(2);	// fan-in 2
	}

	delay_t load(int inum) const
	{
		int N = numOutputs();
		// A,B inputs
		if (inum < 2*N) return LOAD_AND;
		// SEL input
		return N*2*LOAD_AND;
	}

	area_t area() const
	{
		return numOutputs() * (2*AREA_AND(2) + AREA_OR(2));	// fan-in 2
	}

	energy_t energy(int onum) const
	{
		return 2*2*ENERGY_AND + 2*ENERGY_OR;
	}
};

#endif // BENC_H_
