//  1 Nov 2021 04:39
// Change buffers while playing, using set.
//: kiiroi (default buffer). use set to change buffer
// (see snippet following this one).
{ | buf = 0 |
	var amp, src;
	src = PlayBuf.ar(1, buf,
		1,
		1, 0, 1, 2
	);
	Pan2.ar(src, Lag.kr(
		LinLin.kr(\athens1z.in, 0.46, 0.54, 0.7, -0.7),
		5.0),
		Lag.kr(\athens2z.in, 1.0) * 1)
} +> \athens_b;
//:
\athens_b.stop;
//\athens_b.set(\buf, \birdcarmanshort.bufnum);
\athens_b.set(\buf, 'birdcarmanshort'.bufnum);
\athens_b.set(\buf, \takunia.bufnum);
//:
\athens_b.set(\buf, '01kiiroi'.bufnum);
\athens_b.set(\buf, '14pilgrims'.bufnum);
\athens_b.set(\buf, 'bird_crickets'.bufnum);
\athens_b.set(\buf, 'birdcarman'.bufnum);
\athens_b.set(\buf, 'cricket_ff'.bufnum);
\athens_b.set(\buf, 'cricket_taps'.bufnum);
\athens_b.set(\buf, 'crickets'.bufnum);
\athens_b.set(\buf, 'crossing'.bufnum);
\athens_b.set(\buf, 'echo_crickets'.bufnum);
\athens_b.set(\buf, 'fones'.bufnum);
\athens_b.set(\buf, 'hanbaiki'.bufnum);
\athens_b.set(\buf, 'lake_plane'.bufnum);
\athens_b.set(\buf, 'loud_crickets'.bufnum);
\athens_b.set(\buf, 'melodic_road'.bufnum);
\athens_b.set(\buf, 'noisebirdsclick'.bufnum);
\athens_b.set(\buf, 'rough_steps'.bufnum);
\athens_b.set(\buf, 'sweet_crickets'.bufnum);
\athens_b.set(\buf, 'takunia'.bufnum);

//:
\athens_b.stop;
//: select buffer from sensor input
{
	var amp, src;
	src = PlayBuf.ar(1,
		Lag.kr(LinLin.kr(In.kr(\athens1z.index), 0, 1, 0, 10).round(1), 1.0),
		1.05, 0, 1, 2
	);
	Pan2.ar(src, Lag.kr(
		LinLin.kr(\athens1z.in, 0.46, 0.54, 0.7, -0.7),
		5.0),
		Lag.kr(\athens2z.in, 1.0) * 1
	)
} +> \athens_b;
//==================================================
//:Granulation with changeable buffer
{ | buf = 0 |
	var amp, src;
	src = GrainBuf.ar(
		numChannels: 2,
		dur: 0.5,
		trigger: // Impulse.kr(10),
		Impulse.kr(
			LinLin.kr(\athens2z.in, 0.45, 0.55, 1, 10)
		),
		sndbuf:
		Lag.kr(LinLin.kr(In.kr(\athens1z.index), 0, 1, 0, 10).round(1), 1.0),
		rate: LinLin.kr(\athens2y.in, 0.45, 0.55, 0.15, 1.5),
		pos: LinLin.kr(\athens2x.in, 0.45, 0.55, 0.0, 0.9),
		interp: 2,
		pan: 0,
		envbufnum: -1, maxGrains: 512,
		mul: 0.1
		// mul: LinLin.kr(\athens1z.in, 0.45, 0.55, 0.0, 0.1),
		// add: 0
	);
} +> \athens_b;
//:
\athens1z.index;
//==================================================
//: BRICKWALL
{ | buf = 0 |
	var in, chain;
	in = PlayBuf.ar(1, buf,
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BrickWall.new(chain,
		Lag.kr(LinLin.kr(\athens1z.in, 0, 1, -0.99, 0.9), 1.0)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\athens2x.in, 0, 1, -1.0, 1.0),
		LinLin.kr(\athens2z.in, 0, 1, -1.0, 1.0)

	);
	//	Pan2.ar(src, \athens1y.in - 0.5, \athens1z.in - 0.3);
} +> \athens_b;
//==================================================
//: BRICKWALL with changeable buffer
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1,
		Lag.kr(LinLin.kr(In.kr(\athens1z.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BrickWall.new(chain,
		Lag.kr(LinLin.kr(\athens1z.in, 0, 1, -0.99, 0.9), 1.0)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\athens2x.in, 0, 1, -1.0, 1.0),
		LinLin.kr(\athens2z.in, 0, 1, -1.0, 1.0)

	);
	//	Pan2.ar(src, \athens1y.in - 0.5, \athens1z.in - 0.3);
} +> \athens_b;
//==================================================
//: BRICKWALL with changeable buffer - wall ctl in right hand
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1,
		Lag.kr(LinLin.kr(In.kr(\athens1z.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BrickWall.new(chain,
		Lag.kr(LinLin.kr(\athens2z.in, 0, 1, -0.99, 0.9), 1.0)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\athens2x.in, 0, 1, -1.0, 1.0),
		LinLin.kr(\athens2z.in, 0, 1, -1.0, 1.0)

	);
	//	Pan2.ar(src, \athens1y.in - 0.5, \athens1z.in - 0.3);
} +> \athens_b;
//==================================================
//: MAGABOVE
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, buf,
		// Lag.kr(\athens1y.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagAbove(chain,
		Lag.kr(LinLin.kr(\athens1z.in, 0, 1, 0, 15), 0.5),
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\athens1x.in, 0, 1, -1.0, 1.0),
		Lag.kr(LinLin.kr(\athens2z.in, 0, 1, 0, 1), 0.5)
	) * 3;
	//	Pan2.ar(src, \athens1y.in - 0.5, \athens1z.in - 0.3);
} +> \athens_b;
//: MAGABOVE - bufctl in left hand z
// conrtrol seeems best on this one for dialog
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		Lag.kr(LinLin.kr(In.kr(\athens1z.index), 0, 1, 0, 10).round(1), 1.0),
		// Lag.kr(\athens1y.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagAbove(chain,
		Lag.kr(LinLin.kr(\athens1z.in, 0, 1, 0, 15), 0.5),
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\athens1x.in, 0, 1, -1.0, 1.0),
		Lag.kr(LinLin.kr(\athens2z.in, 0, 1, 0, 1), 0.5)
	) * 3;
	//	Pan2.ar(src, \athens1y.in - 0.5, \athens1z.in - 0.3);
} +> \athens_b;
//:
//==================================================
//: MAGBELOW
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, buf,
		// Lag.kr(\athens1y.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagBelow(chain,
		Lag.kr(LinLin.kr(\athens1z.in, 0, 1, 0, 20), 0.5)
	);
    Pan2.ar(IFFT(chain),
		Lag.kr(LinLin.kr(\athens2y.in, 0, 1, -1.0, 1.0), 1.0),
		Lag.kr(LinLin.kr(\athens2z.in, 0, 1, 0.0, 1.0), 1.0),
	);
	//	Pan2.ar(src, \athens1y.in - 0.5, \athens1z.in - 0.3);
} +> \athens_b;
//==================================================
//: MAGBELOW - bufctl in left hand z
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		Lag.kr(LinLin.kr(In.kr(\athens1z.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagBelow(chain,
		Lag.kr(LinLin.kr(\athens1z.in, 0, 1, 0, 20), 0.5)
	);
    Pan2.ar(IFFT(chain),
		Lag.kr(LinLin.kr(\athens2y.in, 0, 1, -1.0, 1.0), 1.0),
		Lag.kr(LinLin.kr(\athens2z.in, 0, 1, 0.0, 1.0), 1.0),
	);
	//	Pan2.ar(src, \athens1y.in - 0.5, \athens1z.in - 0.3);
} +> \athens_b;
//==================================================
//: BINSHIFT
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, buf,
		// Lag.kr(\athens1y.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BinShift(chain,
		// \stretch.kr(1),
		\athens1x.in * 4,
		\athens1z.in * 4,
		1
		// Lag.kr(LinLin.kr(\athens1x.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\athens2y.in, 0, 1, -1.0, 1.0),
		LinLin.kr(\athens2z.in, 0, 1,  0.0, 1.0),

	);
	//	Pan2.ar(src, \pporo1y.in - 0.5, \athens1z.in - 0.3);
} +> \athens_b;

//: BINSHIFT - with buf selection in left hand z
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		// Lag.kr(\athens1y.in, 0.5),
		Lag.kr(LinLin.kr(In.kr(\athens1z.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BinShift(chain,
		// \stretch.kr(1),
		\athens1x.in * 4,
		\athens1z.in * 4,
		1
		// Lag.kr(LinLin.kr(\athens1x.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\athens2y.in, 0, 1, -1.0, 1.0),
		LinLin.kr(\athens2z.in, 0, 1,  0.0, 1.0),

	);
	//	Pan2.ar(src, \pporo1y.in - 0.5, \athens1z.in - 0.3);
} +> \athens_b;

//: MAGSHIFT
// MARY SHOULD PLAY WITH THE CONTRASTS OF VERY HIGH AND VERY LOW FREQUENCIES
{
	var buf, in, chain;
	buf = \buf.kr(\cricket_ff.bufnum);
	in = PlayBuf.ar(1, buf,
		// Lag.kr(\athens1y.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagShift(chain,
		// \stretch.kr(1),
		Lag.kr(\athens1x.in, 1.0) * 4,
		Lag.kr(\athens1y.in, 1.0) * 4,
		// \athens1z.in * 4,
		// \athens1z.in * 4,
		1
		// Lag.kr(LinLin.kr(\athens1x.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		Lag.kr(LinLin.kr(\athens2y.in, 0, 1, -1.0, 1.0), 1.0),
		Lag.kr(\athens2z.in, 1.0)
	);
	//	Pan2.ar(src, \pporo1y.in - 0.5, \athens1z.in - 0.3);
} +> \athens_b;
//==================================================
//: MAGSHIFT - with buf control in left hand z
// MARY SHOULD PLAY WITH THE CONTRASTS OF VERY HIGH AND VERY LOW FREQUENCIES
{
	var buf, in, chain;
	buf = \buf.kr(\cricket_ff.bufnum);
	in = PlayBuf.ar(1, // buf,
		// Lag.kr(\athens1y.in, 0.5),
		Lag.kr(LinLin.kr(In.kr(\athens1z.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagShift(chain,
		// \stretch.kr(1),
		Lag.kr(\athens1x.in, 1.0) * 4,
		Lag.kr(\athens1y.in, 1.0) * 4,
		// \athens1z.in * 4,
		// \athens1z.in * 4,
		1
		// Lag.kr(LinLin.kr(\athens1x.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		Lag.kr(LinLin.kr(\athens2y.in, 0, 1, -1.0, 1.0), 1.0),
		Lag.kr(\athens2z.in, 1.0)
	);
	//	Pan2.ar(src, \pporo1y.in - 0.5, \athens1z.in - 0.3);
} +> \athens_b;
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
			LinLin.kr(\athens1x.in, 0.0, 1.0, 5, 0.2)
		),
		sndbuf: buf,
		rate: LinLin.kr(\athens2x.in, 0.0, 1.0, 0.25, 1.0),
		pos: LinLin.kr(\athens2z.in, 0.0, 1.0, 0.0, 1.0),
		interp: 2,
		pan: 0,
		envbufnum: -1, maxGrains: 512, mul: 1,
		add: 1
	);
	src * Lag.kr(\athens2z.in, 1.0)
} +> \athens_b;
//==================================================
