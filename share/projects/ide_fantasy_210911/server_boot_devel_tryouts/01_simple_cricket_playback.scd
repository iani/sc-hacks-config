//:
//: a useable sound w xyz control + settable buffers
{
	var amp, src, buf;
	buf = \buf.kr(\melodic_road.bufnum);
	src = PlayBuf.ar(1, buf,
		In.kr(\sapporo1x.index) - 0.3 * 5,
		1, 0, 1, 2
	);
	Pan2.ar(src, \sapporo1y.in - 0.5, \sapporo1z.in - 0.3);
} +> \test;
//: Try out different buffers
\test.set(\buf, \melodic_road.bufnum);
\test.set(\buf, \sweet_crickets.bufnum);
\test.set(\buf, \cricket_ff.bufnum);
\test.set(\buf, \crickets.bufnum);
\test.set(\buf, \bird_crickets.bufnum);
\test.set(\buf, \cricket_taps.bufnum);
\test.set(\buf, \crossing.bufnum);
\test.set(\buf, \echo_crickets.bufnum);
\test.set(\buf, \hanbaiki.bufnum);
\test.set(\buf, \lake_plane.bufnum);
\test.set(\buf, \loud_crickets.bufnum);
\test.set(\buf, \rough_steps.bufnum);
//: select buffer from sensor input
{
	var amp, src;
	src = PlayBuf.ar(1,
		LinLin.kr(In.kr(\sapporo1x.index), 0, 1, 0, 10).round(1),
		1, 0, 1, 2
	);
	Pan2.ar(src, \sapporo1y.in - 0.5, \sapporo1z.in - 0.3);
} +> \test;
