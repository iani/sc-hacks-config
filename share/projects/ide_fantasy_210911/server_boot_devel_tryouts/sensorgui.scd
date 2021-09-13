/* 13 Sep 2021 22:40

*/

var corfu, sapporo, allsensors, font, window;
corfu = [3, 4] collect: { | n |
	[\x, \y, \z] collect: { | d |
		format("corfu%%", n, d)
	}
};
sapporo = [1, 2] collect: { | n |
	[\x, \y, \z] collect: { | d |
		format("sapporo%%", n, d)
	}
};
allsensors = [sapporo, corfu].flat;
font = Font("Helvetica", 24);
window = \sensors.bl_.window;
window.v(
	*allsensors.collect({ | s |
		HLayout(
			StaticText()
			.font_(font)
			.string_(s)
			.minWidth_(120),
			Slider().orientation_(\horizontal),
			NumberBox().maxWidth_(120).font_(font)
		)
	})
);
{
window.bounds = Rect(0, 0, 800, 500);
}.defer(0.1)
//:

allsensors = ["corfu", "sapporo"];

//:
collect: { | place |


}