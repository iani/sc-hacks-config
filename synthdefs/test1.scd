SynthDef("test1a", {
	Out.ar(0, Mix(LFSaw.ar(400 * [1, 2, 3], 0, 0.1)).dup)
})