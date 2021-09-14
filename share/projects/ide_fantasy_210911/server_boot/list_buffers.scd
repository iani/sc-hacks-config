postf("Buffers for project % are:\n", Config.projectName);
Config.bufferNames.postln;
\projectbuffers.br_(height: 800).window.v(
	ListView()
	.font_(Font("Helvetica", 24))
	.items_(Config.bufferNames)
	.action_({ | me |
		var item;
		postf("playing buffer: %\n", me.item);
		me.item.buf.postln;
		// me.item.class.postln;
		// me.item.buf.postln;
		me.item.buf.play;
	})
)