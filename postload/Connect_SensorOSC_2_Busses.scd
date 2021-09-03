/*  3 Sep 2021 12:44

*/
{
var sensor1busses, sensor2busses, allbusses;
sensor1busses = [\x1.bus, \y1.bus, \z1.bus];
sensor2busses = [\x2.bus, \y2.bus, \z2.bus];
allbusses = [nil, sensor1busses, sensor2busses];

OSCFunc({ | msg |
	var message, index, axisdata, sensorbusses;
	#message, index ... axisdata = msg;
	sensorbusses = allbusses[index];
	axisdata do: { | value, index |
		sensorbusses[index].set(value);
	};
	postf("received from sensor %, data: %\n", index, axisdata);

}, '/minibee/data').fix;
}.value;
//:
{
	var testsynth;
	testsynth = { | freq = 0.5 |
		SinOsc.ar(LinLin.ar(freq, 0.47, 0.53, 100, 5000), 0, 0.3).dup;
	}.play;
	testsynth.onStart({
		testsynth.map(\freq, \x1.bus.index);
	})
}; // .value;
//:
{
	var testsynth;
	testsynth = {
		SinOsc.ar(LinLin.ar(
			In.kr(\x1.bus.index),
			0.47, 0.53, 100, 5000), 0, 0.3).dup;
	}.play;
};// .value;
//:
{
	var testsynth;
	testsynth = {
		SinOsc.ar(LinLin.ar(\x1.bkr, 0.47, 0.53, 100, 5000), 0, 0.3).dup;
	}.play;
}.value;
//:
