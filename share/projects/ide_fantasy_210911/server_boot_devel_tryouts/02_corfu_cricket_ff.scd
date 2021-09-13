// { WhiteNoise.ar(0.1) } +> \crickets;
// \crickets.bufnum;
//
// { PlayBuf.ar(1, \crickets.bufnum ) } +> \crickets;
//:
currentEnvironment[\crickets] = { | rate = 0.5 |
    var src, pos, level;
	src = PlayBuf.ar(1, \crickets.bufnum,
		LinLin.kr(rate, 0.4, 0.6, 0.5, 1.5),
		1, 0, 1, 2
	);

	Pan2.ar(src, \pos.kr(0.0), \level.kr(1))
}.play;
//:
// \crickets.set(\rate, 0.4);
// \crickets.set(\level, 3.0);
// \crickets.set(\pos, -1.0);
//:
\sapporo.fox({ | x |
	// postf("received x value: %\n", x);
	\crickets.set(\rate, x);
});
//:
\sapporo.foy({ | x |
	// postf("received x value: %\n", x);
	\crickets.set(\level, x);
});
//:
\sapporo.foz({ | x |
	// postf("received x value: %\n", x);
	\crickets.set(\pos, x);
});
//: