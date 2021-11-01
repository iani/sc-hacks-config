/* 14 Sep 2021 10:27
Add filter to grains
*/

//:
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, buf,
		// Lag.kr(\sapporo1y.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BrickWall.new(chain,
		Lag.kr(LinLin.kr(\sapporo1x.in, 0, 1, -0.99, 0.6), 0.5)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\sapporo1y.in, 0, 1, -1.0, 1.0)
	);
	//	Pan2.ar(src, \sapporo1y.in - 0.5, \sapporo1z.in - 0.3);
} +> \test

//:
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
\test.set(\buf, \rough_steps.bufnum)

{
	var src, buf, in, chain;
	buf = \buf.kr(\crickets.bufnum);
	in = ;
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagAbove(chain, 310);
    Out.ar(out, 0.1 * IFFT(chain).dup);

} +> \test
//:
PV_BrickWall