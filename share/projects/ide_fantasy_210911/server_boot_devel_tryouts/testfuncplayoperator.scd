{ WhiteNoise.ar(0.1).dup } +> \test;
//:
a = { WhiteNoise.ar(0.1) }.play;
a onStart: { "started".postln; };
//:
a;
a.isPlaying;