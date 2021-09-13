/* 11 Sep 2021 12:15
	13 Sep 2021 14:20
*/
//: busses
[1, 2] do: { | i |
	[\x, \y, \z] do: { | d |
		format("\sapporo%%", i, d).asSymbol.bus.postln;
	}
};
//: busses
[3, 4] do: { | i |
	[\x, \y, \z] do: { | d |
		format("\corfu%%", i, d).asSymbol.bus.postln;
	}
};
//:
\sapporo +++> { | ... args | args.postln; };
\sapporo.remove;
//:
\sapporo.bl_(height: 100).v(
	Slider().orientation_(\horizontal),
	Slider().orientation_(\horizontal),
	Slider().orientation_(\horizontal),
	Slider().orientation_(\horizontal),
	Slider().orientation_(\horizontal),
	Slider().orientation_(\horizontal),
	Slider().orientation_(\horizontal)
);
//:
\sapporo.window.bounds = Rect(0, 0, 800, 300);