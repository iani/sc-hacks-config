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
    chain = PV_MagBelow(chain,
		Lag.kr(LinLin.kr(\sapporo1x.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\sapporo1y.in, 0, 1, -1.0, 1.0)
	);
	//	Pan2.ar(src, \sapporo1y.in - 0.5, \sapporo1z.in - 0.3);
} +> \test

//: