//  1 Nov 2021 04:39
//
//: melodic_road
{
	var amp, src, buf;
	buf = \buf.kr(\melodic_road.bufnum);
	src = PlayBuf.ar(1, buf,
		1,
		1, 0, 1, 2
	);
	Pan2.ar(src, Lag.kr(
		LinLin.kr(\corfu1z.in, 0.46, 0.54, 0.7, -0.7),
		5.0),
		Lag.kr(\corfu2z.in, 1.0) * 1)
} +> \corfu_b;
//: takunia
{
	var amp, src, buf;
	buf = \buf.kr(\takunia.bufnum);
	src = PlayBuf.ar(1, buf,
		1,
		1, 0, 1, 2
	);
	Pan2.ar(src, Lag.kr(
		LinLin.kr(\corfu1z.in, 0.46, 0.54, 0.7, -0.7),
		5.0),
		Lag.kr(\corfu2z.in, 1.0) * 1)
} +> \corfu_b;
//:
//
\corfu_b.stop;

//==================================================
//: VARIANT USING Z FOR AMP CONTROL
{
	var amp, src, buf;
	buf = \buf.kr(\melodic_road.bufnum);
	src = PlayBuf.ar(1, buf,
		Lag.kr(
			LinLin.kr(In.kr(\corfu1z.index), 0.3, 1.2), 1.0),
		1, 0, 1, 2
	);
	Pan2.ar(src, \corfu2x.in - 0.5 * 2,
		Lag.kr(\corfu2z.in, 1.0));
} +> \corfu_b;
//==================================================
//: select buffer from sensor input
{
	var amp, src;
	src = PlayBuf.ar(1,
		Lag.kr(LinLin.kr(In.kr(\corfu1z.index), 0, 1, 0, 10).round(1), 1.0),
		1.05, 0, 1, 2
	);
	Pan2.ar(src, \corfu2x.in - 0.5 * 2, \corfu2z.in);
} +> \corfu_b;
//==================================================
//:Granulation early version -
// use as texture background in one voice
// contrasting with other voice
{
	var amp, src, buf;
	buf = \buf.kr(\melodic_road.bufnum);
	src = GrainBuf.ar(
		numChannels: 2,
		dur: 0.5,
		trigger: // Impulse.kr(10),
		Impulse.kr(
			LinLin.kr(\corfu2z.in, 0.45, 0.55, 1, 10)
		),
		sndbuf: buf,
		rate: LinLin.kr(\corfu2y.in, 0.45, 0.55, 0.15, 1.5),
		pos: LinLin.kr(\corfu1x.in, 0.45, 0.55, 0.10, 0.9),
		interp: 2,
		pan: 0,
		envbufnum: -1, maxGrains: 512,
		mul: LinLin.kr(\corfu1z.in, 0.47, 0.55, 0.0, 0.1),
		add: 0
	);
} +> \corfu_b;
//==================================================
//: BRICKWALL
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, buf,
		// Lag.kr(\corfu1y.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BrickWall.new(chain,
		Lag.kr(LinLin.kr(\corfu1z.in, 0, 1, -0.99, 0.9), 1.0)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\corfu2x.in, 0, 1, -1.0, 1.0),
		LinLin.kr(\corfu2z.in, 0, 1, -1.0, 1.0)

	);
	//	Pan2.ar(src, \corfu1y.in - 0.5, \corfu1z.in - 0.3);
} +> \corfu_b;
//==================================================
//: MAGABOVE
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, buf,
		// Lag.kr(\corfu1y.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagAbove(chain,
		Lag.kr(LinLin.kr(\corfu1z.in, 0, 1, 0, 15), 0.5),
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\corfu1x.in, 0, 1, -1.0, 1.0),
		Lag.kr(LinLin.kr(\corfu2z.in, 0, 1, 0, 1), 0.5)
	) * 3;
	//	Pan2.ar(src, \corfu1y.in - 0.5, \corfu1z.in - 0.3);
} +> \corfu_b;
//:
//==================================================
//: MAGBELOW
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, buf,
		// Lag.kr(\corfu1y.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagBelow(chain,
		Lag.kr(LinLin.kr(\corfu1z.in, 0, 1, 0, 20), 0.5)
	);
    Pan2.ar(IFFT(chain),
		Lag.kr(LinLin.kr(\corfu2y.in, 0, 1, -1.0, 1.0), 1.0),
		Lag.kr(LinLin.kr(\corfu2z.in, 0, 1, 0.0, 1.0), 1.0),
	);
	//	Pan2.ar(src, \corfu1y.in - 0.5, \corfu1z.in - 0.3);
} +> \corfu_b;
//==================================================
//: BINSHIFT
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, buf,
		// Lag.kr(\corfu1y.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BinShift(chain,
		// \stretch.kr(1),
		\corfu1x.in * 4,
		\corfu1z.in * 4,
		1
		// Lag.kr(LinLin.kr(\corfu1x.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\corfu2y.in, 0, 1, -1.0, 1.0),
		LinLin.kr(\corfu2z.in, 0, 1,  0.0, 1.0),

	);
	//	Pan2.ar(src, \pporo1y.in - 0.5, \corfu1z.in - 0.3);
} +> \corfu_b;

//: MAGSHIFT
// MARY SHOULD PLAY WITH THE CONTRASTS OF VERY HIGH AND VERY LOW FREQUENCIES
{
	var buf, in, chain;
	buf = \buf.kr(\cricket_ff.bufnum);
	in = PlayBuf.ar(1, buf,
		// Lag.kr(\corfu1y.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagShift(chain,
		// \stretch.kr(1),
		Lag.kr(\corfu1x.in, 1.0) * 4,
		Lag.kr(\corfu1y.in, 1.0) * 4,
		// \corfu1z.in * 4,
		// \corfu1z.in * 4,
		1
		// Lag.kr(LinLin.kr(\corfu1x.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		Lag.kr(LinLin.kr(\corfu2y.in, 0, 1, -1.0, 1.0), 1.0),
		Lag.kr(\corfu2z.in, 1.0)
	);
	//	Pan2.ar(src, \pporo1y.in - 0.5, \corfu1z.in - 0.3);
} +> \corfu_b;
//==================================================
//: Granulation again
//:
{
	var amp, src, buf;
	buf = \buf.kr(\crickets.bufnum);
	src = GrainBuf.ar(
		numChannels: 2,
		dur: 1.5,
		trigger: Impulse.kr(
			LinLin.kr(\corfu1x.in, 0.0, 1.0, 5, 0.2)
		),
		sndbuf: buf,
		rate: LinLin.kr(\corfu2x.in, 0.0, 1.0, 0.25, 1.0),
		pos: LinLin.kr(\corfu2z.in, 0.0, 1.0, 0.0, 1.0),
		interp: 2,
		pan: 0,
		envbufnum: -1, maxGrains: 512, mul: 1,
		add: 1
	);
	src * Lag.kr(\corfu2z.in, 1.0)
} +> \corfu_b;
//==================================================
