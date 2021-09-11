// { WhiteNoise.ar(0.1) } +> \sweet_crickets;
// \sweet_crickets.bufnum;
//
// { PlayBuf.ar(1, \sweet_crickets.bufnum ) } +> \sweet_crickets;
//:
currentEnvironment[\crickets] = { | rate = 0.5 |
    var src, pos, level;
	src = PlayBuf.ar(1, \crickets.bufnum,
		LinLin.kr(rate, 0.42, 0.56, 0.025, 5.5),
		1, 0, 1, 2
	);
	pos = LinLin.kr(\pos.kr(0.5), 0.42, 0.56, 0.0, 0.1);
	level =  LinLin.kr(\level.kr(0.5), 0.42, 0.56, 0.0, 1.1);
	Pan2.ar(src, pos, level)
}.play;
//:
// \sweet_crickets.set(\rate, 0.4);
// \sweet_crickets.set(\level, 3.0);
// \sweet_crickets.set(\pos, -1.0);
//:

\sapporo.fox({ | x |
	// postf("received x value: %\n", x);
	currentEnvironment[\crickets].postln;
	\crickets.set(\rate, x);
});
//:
\sapporo.foy({ | x |
	// postf("received x value: %\n", x);
	\crickets.set(\level, x);
});
//:
\sapporo.foz({ |5 x 0|
	// postf("received x value: %\n", x);
	\crickets.set(\pos, x);
});
//:
currentEnvironment[\crickets] = { | rate = 0.5 |
	WhiteNoise.ar(LinLin.kr(rate, 0.4, 0.55, 0.0, 2.0))
}.play