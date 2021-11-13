//  1 Nov 2021 04:39
// Change buffers while playing, using set.
//
//: ------ 1 ------ ~0:00
// kiiroi (default buffer).
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
//: ------ 2 ------ ~0:30
\athens_b stop: 5;
//: ------ 3 ------ ~0:35
// preacherman solo - then takunia - then dialog preacherman-takunia
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
//: ------ 3.1 ------ ~3:00
\athens_b stop: 5;
//: ------ 4 ------ ~3:05
// BRICKWALL with changeable buffer
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
//: ------ 5 ------ ~5:00
// MAGABOVE - bufctl in left hand z
// conrtrol seeems best on this one for dialog
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		Lag.kr(LinLin.kr(In.kr(\athens1x.index), 0, 1, 0, 10).round(1), 1.0),
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
//: ------ 6 ------ ~7:00
// MAGBELOW - bufctl in left hand z
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		Lag.kr(LinLin.kr(In.kr(\athens1x.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagBelow(chain,
		Lag.kr(LinLin.kr(\athens1z.in, 0.42, 0.59, 0, 30), 0.5)
	);
    Pan2.ar(IFFT(chain),
		Lag.kr(LinLin.kr(\athens2y.in, 0, 1, -1.0, 1.0), 1.0),
		Lag.kr(LinLin.kr(\athens2z.in, 0, 1, 0.0, 1.0), 1.0),
	);
	//	Pan2.ar(src, \athens1y.in - 0.5, \athens1z.in - 0.3);
} +> \athens_b;
//: ------ 7 ------ ~9:00
// BINSHIFT - with buf selection in left hand z
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
//: ------ 8 ------ ~11:00
// MAGSHIFT - with buf control in left hand z
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
//: ------ 9 ------ ~13:00
\athens_b stop: 5;
//==================================================
// TAKUNIA! -> see corfu!
//==================================================
//
//: ------ 10 ------ ~13:30
// MAGABOVE - bufctl in left hand z
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		Lag.kr(LinLin.kr(In.kr(\athens1x.index), 0, 1, 0, 10).round(1), 1.0),
		// Lag.kr(\athens1y.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagAbove(chain,
		Lag.kr(LinLin.kr(\athens1z.in, 0.44, 0.56, 0, 35), 0.5),
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\athens1x.in, 0, 1, -1.0, 1.0),
		Lag.kr(LinLin.kr(\athens2z.in, 0, 1, 0, 1), 0.5)
	) * 3;
	//	Pan2.ar(src, \athens1y.in - 0.5, \athens1z.in - 0.3);
} +> \athens_b;

//: ------ 11 ------ ~15:30
// BINSHIFT - with buf selection in left hand z

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


//: ------ 12 ------ ~17:30
// END

\athens_b.stop(5);
\athens_b.stop(15);
\athens_b.stop(20);