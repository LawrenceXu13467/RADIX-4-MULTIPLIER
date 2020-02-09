#ifndef MULRADIX4BOOTH_H_
#define MULRADIX4BOOTH_H_
#include<iostream>
#include<cmath>

#include "SystemModule.h"
#include "BENC.h"
#include "PreCompute.h"
#include "MUX5to1.h"
#include "SaveAdder.h"
#include "RippleAdder.h"

// Multiplexer
// Z = (A AND NOT SEL) OR (B AND SEL)
//
// N-bit inputs A,B
// 1-bit input SEL
// N-bit output Z

class MULRadix4Booth : public SystemModule
{
private:
BENC* bencPtr;
MUX5to1* muxPtr;
SaveAdder* savePtr;
RippleAdder* ripPtr;
PreCompute* pres;
public:
	MULRadix4Booth(int N)
	{
		addInput("X",N); // multiplicand
		addInput("Y",N); // multiplier
		addInput("Zero",1);

		addOutput("P",2*N); //product

		std::stringstream ss;
		ss << "MULRadix4Booth<" << N << ">";
		classname_ = ss.str();

		
		for (int i=0; i<1; i++) {
			pres = new PreCompute(N);
		}
		PreCompute& pre = pres[0];
		submodule(&pre);
		IN("Y") >> pre("A");

		bencPtr = new BENC [int(ceil(N/2))];

		int MUXObjects = int(ceil(N/2));
		int SaveObjects = 4; //TODO Generalize this

		MUX5to1* MUXObjectArray[MUXObjects];
		SaveAdder* SaveObjectArray[SaveObjects];

		for (int i=0; i<MUXObjects; i++) {
			MUXObjectArray[i] = new MUX5to1(2*N);
		}

		for (int i=0; i<SaveObjects; i++) {
			SaveObjectArray[i] = new SaveAdder(2*N);
		}

		int HalfN = int(ceil(N/2));

		for (int i = 0; i < HalfN; i++)
		{
			BENC& benc = bencPtr[i];
			MUX5to1& mux = *MUXObjectArray[i];
			submodules(2, &benc, &mux);
			if(i==0)
			{
				IN("Zero") >> benc("B0");
				IN("Y",0) >> benc("B1");
				IN("Y",1) >> benc("B2");
				benc("Y") >> mux("SEL");
			}
			else
			{
				IN("Y",2*i-1) >> benc("B0");
				IN("Y",2*i) >> benc("B1");
				IN("Y",2*i+1) >> benc("B2");
				benc("Y") >> mux("SEL");
			}
		}



		MUX5to1& mux1 = *MUXObjectArray[0];
		MUX5to1& mux2 = *MUXObjectArray[1];
		MUX5to1& mux3 = *MUXObjectArray[2];
		MUX5to1& mux4 = *MUXObjectArray[3];
		MUX5to1& mux5 = *MUXObjectArray[4];
		MUX5to1& mux6 = *MUXObjectArray[5];
		for (int i = 0; i < SaveObjects; i++)
		{
			SaveAdder& save = *SaveObjectArray[i];
			submodule(&save);
		}

		SaveAdder& save1 = *SaveObjectArray[0];
		SaveAdder& save2 = *SaveObjectArray[1];
		SaveAdder& save3 = *SaveObjectArray[2];
		SaveAdder& save4 = *SaveObjectArray[3];

		mux1("Z") >> save1("X");
		mux2("Z") >> save1("Y");
		mux3("Z") >> save1("Ci");

		mux4("Z") >> save2("X");
		mux5("Z") >> save2("Y");
		mux6("Z") >> save2("Ci");

		save1("S") >> save3("X");
		save1("Co") >> save3("Y");
		save2("S") >> save3("Ci");

		save2("Co") >> save4("X");
		save3("S") >> save4("Y");
		save3("Co") >> save4("Ci");
		

		RippleAdder rip(2*N);

		ripPtr = &rip;

		submodule(ripPtr);
		
		save4("S") >> rip("X");
		save4("Co") >> rip("Y");

		OUT("P") << rip("S");

	}


};

#endif // MULRADIX4BOOTH_H_
