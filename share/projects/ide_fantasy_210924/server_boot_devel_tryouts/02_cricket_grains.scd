/* 14 Sep 2021 10:27
GrainBuf.ar(numChannels: 1,
	trigger: 0, dur: 1, sndbuf, rate: 1, pos: 0, interp: 2, pan: 0,
	envbufnum: -1, maxGrains: 512, mul: 1, add: 0)

BufGrain.ar(trigger: 0, dur: 1, sndbuf, rate: 1, pos: 0, interp: 2,
	mul: 1, add: 0)
*/
//:
{
	var amp, src, buf;
	buf = \buf.kr(\crickets.bufnum);
	src = GrainBuf.ar(
		numChannels: 2,
		dur: 1.5,
		trigger: Impulse.kr(
			LinLin.kr(\sapporo1x.in, 0.2, 0.7, 2, 10)
		),
		sndbuf: buf,
		rate: LinLin.kr(\sapporo1y.in, 0.2, 0.7, 0.5, 1.5),
		pos: LinLin.kr(\sapporo1z.in, 0.2, 0.7, 0.0, 1.0),
		interp: 2,
		pan: 0,
		envbufnum: -1, maxGrains: 512, mul: 1, add: 0
	);
} +> \test
//:
\test.set(\buf, \crickets.bufnum);