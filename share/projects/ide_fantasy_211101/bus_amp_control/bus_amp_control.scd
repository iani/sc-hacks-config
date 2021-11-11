{ WhiteNoise.ar(0.1).dup } +> \test;
//:
\test.stop;
//:
{ WhiteNoise.ar(0.01).dup * \athens1x.in } +> \test;
{ WhiteNoise.ar(0.01).dup * \athens1y.in } +> \test;
{ WhiteNoise.ar(0.01).dup * \athens1z.in } +> \test;
//:
{ WhiteNoise.ar(0.01).dup * (\athens1x.in + \athens1y.in + \athens1z.in) } +> \test;
//:
{ WhiteNoise.ar(0.01).dup * (\athens1z.in > 0.5) } +> \test;

{ WhiteNoise.ar(0.01).dup * \athens1y.in } +> \test;
//:
{ WhiteNoise.ar(0.1).dup * Changed.kr(\athens1z.in) } +> \test;
//:
{ WhiteNoise.ar(0.75).dup *
	Lag.kr(Changed.kr(\athens1z.in), 1) } +> \test;
//:
{ WhiteNoise.ar(0.75).dup *
	Lag.kr(Changed.kr(\athens1z.in, 0.01), 1) } +> \test;
//:
{ WhiteNoise.ar(0.1).dup *
	Lag.kr(Changed.kr(
		Amplitude.kr(\athens1z.in)
	), 1) } +> \test;
//:
{ WhiteNoise.ar(0.1).dup *
	Lag.kr(Changed.kr(
		Amplitude.kr(\athens1z.in), 0.001
	), 1) } +> \test;
//:
{ WhiteNoise.ar(0.5).dup *
	Lag.kr(Changed.kr(
		Amplitude.kr(\athens1z.in, 0.1, 0.0), 0.005
	), 1) } +> \test;
//:
{ WhiteNoise.ar(0.5).dup *
	Lag.kr(Changed.kr(
		Amplitude.kr(\athens1x.in, 0.1, 0.0)
		+ Amplitude.kr(\athens1y.in, 0.1, 0.0)
		+ Amplitude.kr(\athens1z.in, 0.1, 0.0),


		0.0001
	), 1) } +> \test;
//:
Server.default.scope;
//:
(
{
	Env([0, 1, 1, 0], [0.01, 0.98, 0.01])
	.kr(gate: Impulse.kr(0.9))
	* WhiteNoise.ar(0.1)
} +> \test;
)
//:

{ Blip.ar(Latch.ar(WhiteNoise.ar, Impulse.ar(9)) * 400 + 500, 4, 0.2) }.play;




Env.welch.plot;




Env.shapeNames;




















