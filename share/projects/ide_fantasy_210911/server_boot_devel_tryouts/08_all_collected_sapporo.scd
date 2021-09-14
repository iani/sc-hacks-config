/* 14 Sep 2021 13:15

*/

//: a useable sound w xyz control + settable buffers
{
	var amp, src, buf;
	buf = \buf.kr(\melodic_road.bufnum);
	src = PlayBuf.ar(1, buf,
		In.kr(\sapporo1x.index),
		1, 0, 1, 2
	);
	Pan2.ar(src, \sapporo2y.in - 0.5 * 2, \sapporo2x.in);
} +> \saporo;
//==================================================
//: VARIANT USING Z FOR AMP CONTROL
{
	var amp, src, buf;
	buf = \buf.kr(\melodic_road.bufnum);
	src = PlayBuf.ar(1, buf,
		In.kr(\sapporo2x.index),
		1, 0, 1, 2
	);
	Pan2.ar(src, \sapporo2y.in - 0.5 * 2, \sapporo1z.in);
} +> \saporo;
//==================================================
//: select buffer from sensor input
{
	var amp, src;
	src = PlayBuf.ar(1,
		LinLin.kr(In.kr(\sapporo1x.index), 0, 1, 0, 10).round(1),
		1, 0, 1, 2
	);
	Pan2.ar(src, \sapporo2y.in - 0.5 * 2, \sapporo2x.in);
} +> \saporo;
//==================================================
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
} +> \saporo
//==================================================
//: BRICKWALL
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
} +> \saporo
//==================================================
//: MAGABOVE
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, buf,
		// Lag.kr(\sapporo1y.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagAbove(chain,
		Lag.kr(LinLin.kr(\sapporo1x.in, 0, 1, 0, 15), 0.5)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\sapporo1y.in, 0, 1, -1.0, 1.0)
	);
	//	Pan2.ar(src, \sapporo1y.in - 0.5, \sapporo1z.in - 0.3);
} +> \saporo
//:
//==================================================
//: MAGBELOW
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
} +> \saporo
//==================================================
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
} +> \saporo

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
    chain = PV_MagShift(chain,
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
} +> \saporo

//: