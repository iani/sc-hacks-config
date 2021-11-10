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
//:preacherman
{ | buf = 0 |
	var amp, src;
	buf = 'birdcarmanshort'.bufnum;
	src = PlayBuf.ar(1, buf,
		1,
		1, 0, 1, 2
	);
	Pan2.ar(src, Lag.kr(
		LinLin.kr(\athens1z.in, 0.46, 0.54, 0.7, -0.7),
		5.0),
		Lag.kr(\athens2z.in, 1.0) * 1)
} +> \athens_b
//:
\athens_b.stop;
//\athens_b.set(\buf, \birdcarmanshort.bufnum);
\athens_b.set(\buf, 'birdcarmanshort'.bufnum);
\athens_b.set(\buf, \takunia.bufnum);
//:
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
//: END

\athens_b.stop(5);
\athens_b.stop(15);
\athens_b.stop(20);