#include <iostream>
#include <fstream>
#include <cstdlib>
#include "sim.h"
using namespace std;

// Test an adder with given inputs.
//void testAdder(Adder& adder, value_t x, value_t y, Bit c)
//{
//	// set inputs and simulate
//	adder("X") <= x;
//	adder("Y") <= y;
//	adder("Ci") <= c;
//	adder.simulate();
//
//	// print the adder name
//	cout << adder << endl;;
//
//	// print the results and the times
//	cout << x << " + " << y << " + " << c << " = " << "(" << adder("Co") << ")" << adder("S") << endl;
//	cout << "Sum   at T = " << adder.lastTime("S")  << endl;
//	cout << "Carry at T = " << adder.lastTime("Co") << endl;
//
//	// compute static critical path
//	int i, o;
//	delay_t T = adder.criticalPath(&i, &o);
//	cout << "Static critical path: ";
//	if (T < 0) cout << "no path" << endl;
//	else cout << adder.nameOfInput(i) << " -> "
//	          << adder.nameOfOutput(o) << " (T=" << T << ")" << endl;
//
//	// compute area
//	cout << "Area: " << adder.area() << endl;
//
//	// compute average/peak power of the simulation
//	energy_t avgpow, maxpow;
//	adder.simPowerStats(&avgpow, &maxpow);
//	cout << "Avg. power: " << avgpow << endl;
//	cout << "Peak power: " << maxpow << endl;
//	cout << endl;
//}

int main(int argc, char** argv)
{
	if (argc < 4)
	{
		cout << "Usage: " << argv[0] << " B0 B1 B2" << endl;
		return -1;
	}

	// read input values
	Bit b2 = Bit(!!atoi(argv[1]));
	Bit b1 = Bit(!!atoi(argv[2]));
	Bit b0 = Bit(!!atoi(argv[3]));

	//MUX mux(1);
	//
	//// set inputs and simulate
	//mux("A") <= b0;
	//mux("B") <= b1;
	//mux("SEL") <= b2;
	//mux.simulate();

	//// print the mux name
	//cout << mux << endl;;

	//// print the results and the times
	//cout << b2 << b1 << b0 << " = " << "(" << mux("Z") << ")" << endl;
	////cout << "Sum   at T = " << mux.lastTime("S")  << endl;
	////cout << "Carry at T = " << benc1.lastTime("Co") << endl;

	//HA ha();
	//
	//// set inputs and simulate
	//ha("X") <= b0;
	//ha("Y") <= b1;
	//ha.simulate();

	//// print the ha name
	//cout << ha << endl;;

	//// print the results and the times
	//cout << b0 << b1 << " = " << "(" << ha("C") << ")" << ha("S") << endl;
	////cout << "Sum   at T = " << mux.lastTime("S")  << endl;
	////cout << "Carry at T = " << benc1.lastTime("Co") << endl;

	

	BENC benc1(1);

	// set inputs and simulate
	benc1("B0") <= b0;
	benc1("B1") <= b1;
	benc1("B2") <= b2;
	benc1.simulate();

	// print the benc1 name
	cout << benc1 << endl;;

	// print the results and the times
	cout << b2 << b1 << b0 << " = " << "(" << benc1("Y2") << benc1("Y1") << benc1("Y0") << ")" << endl;
	//cout << "Sum   at T = " << benc1.lastTime("S")  << endl;
	//cout << "Carry at T = " << benc1.lastTime("Co") << endl;



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