#include <iostream>
#include <fstream>
#include <cstdlib>
#include "sim.h"
using namespace std;

// Test an adder with given inputs.
void testAdder(Adder& adder, value_t x, value_t y, Bit c)
{
	// set inputs and simulate
	adder("X") <= x;
	adder("Y") <= y;
	adder("Ci") <= c;
	adder.simulate();

	// print the adder name
	cout << adder << endl;;

	// print the results and the times
	cout << x << " + " << y << " + " << c << " = " << "(" << adder("Co") << ")" << adder("S") << endl;
	cout << "Sum   at T = " << adder.lastTime("S")  << endl;
	cout << "Carry at T = " << adder.lastTime("Co") << endl;

	// compute static critical path
	int i, o;
	delay_t T = adder.criticalPath(&i, &o);
	cout << "Static critical path: ";
	if (T < 0) cout << "no path" << endl;
	else cout << adder.nameOfInput(i) << " -> "
	          << adder.nameOfOutput(o) << " (T=" << T << ")" << endl;

	// compute area
	cout << "Area: " << adder.area() << endl;

	// compute average/peak power of the simulation
	energy_t avgpow, maxpow;
	adder.simPowerStats(&avgpow, &maxpow);
	cout << "Avg. power: " << avgpow << endl;
	cout << "Peak power: " << maxpow << endl;
	cout << endl;
}

int main(int argc, char** argv)
{
	if (argc < 4)
	{
		cout << "Usage: " << argv[0] << " X Y Cin" << endl;
		return -1;
	}

	// read input values
	value_t x = atoi(argv[1]);
	value_t y = atoi(argv[2]);
	Bit c = Bit(!!atoi(argv[3]));

	SelectAdder seladder4(4, RippleAdder(2));
//8 bit adders
	// create several adder types
	//RippleAdder ripadder8(8);
	//SkipAdder   skpadder8(8, 2);
	//SelectAdder seladder8(8, RippleAdder(4));
	//LookaheadAdder claadder8(8);
	//LookaheadAdder hcladder8(8,LookaheadAdder(2));
	//PrefixAdder preadder8(8);

	//// test adders
	//testAdder(ripadder8, x, y, c);
	//testAdder(skpadder8, x, y, c);
	//testAdder(seladder8, x, y, c);
	//testAdder(claadder8, x, y, c);
	//testAdder(hcladder8, x, y, c);
	//testAdder(preadder8, x, y, c);

//16 bit adders
	//RippleAdder ripadder16(16);
	//RippleAdder ripadder32(32);
	//SkipAdder   skpadder16(16, 2);
	//SelectAdder seladder16(16, RippleAdder(4));
	//SelectAdder selclaadder16(16, LookaheadAdder(4));
	//SelectAdder seladder32(32, RippleAdder(4));
	//SelectAdder selclaadder32(32, LookaheadAdder(4));
	//LookaheadAdder claseladder16(16,seladder4);
	RippleAdder ripadder1(4);
	SaveAdder saveadder1(4);
	//RippleAdder ripadder2(2);
	//LookaheadAdder claadder16(16);
	//LookaheadAdder hc2ladder16(16,LookaheadAdder(2));
	//LookaheadAdder cladder16(16);
	//LookaheadAdder cladder32(32);
	//LookaheadAdder hc4ladder16(16,LookaheadAdder(4));
	//LookaheadAdder hc4ladder32(32,LookaheadAdder(4));
	//LookaheadAdder hc8ladder16(16,LookaheadAdder(8));
	//SelectAdder seladder16(16, RippleAdder(8));
	//SelectAdder selclaadder16(16, LookaheadAdder(8));
	//PrefixAdder preadder16(16);

	// test adders
	//testAdder(ripadder16, x, y, c);
	//testAdder(ripadder32, x, y, c);
	//testAdder(skpadder16, x, y, c);
	//testAdder(seladder16, x, y, c);
	//testAdder(ripadder1, x, y, c);
	//cout << AREA_XOR(2) << " " << AREA_AND(2) << " " << AREA_NAND(2) << endl;
	//testAdder(ripadder2, x, y, c);
	//testAdder(claadder16, x, y, c);
	//testAdder(hc2ladder16, x, y, c);
	//testAdder(cladder16, x, y, c);
	//testAdder(cladder32, x, y, c);
	//testAdder(hc4ladder16, x, y, c);
	//testAdder(hc4ladder32, x, y, c);
	//testAdder(hc8ladder16, x, y, c);
	//testAdder(seladder16, x, y, c);
	//testAdder(selclaadder16, x, y, c);
	//testAdder(seladder32, x, y, c);
	//testAdder(selclaadder32, x, y, c);
	testAdder(ripadder1, x, y, c);
	saveadder1("X") <= x;
	saveadder1("Y") <= y;
	saveadder1("Ci") <= 1;
	saveadder1.simulate();

	// print the saveadder1 name
	cout << saveadder1 << endl;;

	// print the results and the times
	cout << x << " + " << y << " + " << c << " = " << "(" << saveadder1("Co") << ")" << saveadder1("S") << endl;
	cout << "Sum   at T = " << saveadder1.lastTime("S")  << endl;
	cout << "Carry at T = " << saveadder1.lastTime("Co") << endl;


	//testAdder(selclaadder16, x, y, c);
	//testAdder(preadder16, x, y, c);

//32 bit adders
	//RippleAdder ripadder32(32);
	//SkipAdder   skpadder32(32, 2);
	//SelectAdder seladder32(32, RippleAdder(4));
	//LookaheadAdder claadder32(32);
	//LookaheadAdder hcladder32(32,LookaheadAdder(2));
	//PrefixAdder preadder32(32);

	//// test adders
	//testAdder(ripadder32, x, y, c);
	//testAdder(skpadder32, x, y, c);
	//testAdder(seladder32, x, y, c);
	//testAdder(claadder32, x, y, c);
	//testAdder(hcladder32, x, y, c);
	//testAdder(preadder32, x, y, c);

	// write a waveform file for the last adder's outputs
	//VCDWriter vcdw;
	//vcdw.addSignal(ripadder16, "S");
	//vcdw.addSignal(ripadder16, "Co");
	//ofstream ofs("vcds/dumpCRA16.vcd");
	//vcdw.write(ofs);

	//VCDWriter vcdw1;
	//vcdw1.addSignal(ripadder32, "S");
	//vcdw1.addSignal(ripadder32, "Co");
	//ofstream ofs1("vcds/dumpCRA32.vcd");
	//vcdw1.write(ofs1);
	return 0;
}
