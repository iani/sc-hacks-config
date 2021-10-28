/* 14 Sep 2021 10:27
	PV_BinShift.new(buffer, stretch: 1.0, shift: 0.0, interp: 0)
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
    chain = PV_BinShift(chain,
		// \stretch.kr(1),
		\sapporo1x.in * 4,
		\sapporo1z.in * 4,
		1
		// Lag.kr(LinLin.kr(\sapporo1x.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\sapporo1y.in, 0, 1, -1.0, 1.0)
	);
	//	Pan2.ar(src, \pporo1y.in - 0.5, \sapporo1z.in - 0.3);
} +> \test

//:
\test.set(\stretch, 1.5);