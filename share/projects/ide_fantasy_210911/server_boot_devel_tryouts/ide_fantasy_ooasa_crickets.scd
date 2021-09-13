//
{ | rate = 0.5 |
    var src, pos, level;
	src = PlayBuf.ar(1, \crickets.bufnum,
		//	LinLin.kr(rate, 0.42, 0.56, 0.025, 5.5),
		1,
		1, 0, 1, 2
	).dup * 0.2;
	//	pos = LinLin.kr(\pos.kr(0.5), 0.42, 0.56, 0.0, 0.1);
	// level =  LinLin.kr(\level.kr(0.5), 0.42, 0.56, 0.0, 1.1);
	// Pan2.ar(src, 1, 0);
}.play


// { WhiteNoise.ar(0.3).dup }.play;