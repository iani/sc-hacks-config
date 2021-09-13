/* 13 Sep 2021 22:40

*/

var corfu, sapporo, allsensors, font, window;
var sapporo1sliders, sapporo2sliders, sapporo1nums, sapporo2nums;
var corfu3sliders, corfu4sliders, corfu3nums, corfu4nums;
var allsliders, allnums;

sapporo1sliders = { Slider().orientation_(\horizontal) } ! 3;
sapporo2sliders = { Slider().orientation_(\horizontal) } ! 3;
corfu3sliders = { Slider().orientation_(\horizontal) } ! 3;
corfu4sliders = { Slider().orientation_(\horizontal) } ! 3;

font = Font("Helvetica", 24);
sapporo1nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;
sapporo2nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;
corfu3nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;
corfu4nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;

allsliders = [sapporo1sliders, sapporo2sliders, corfu3sliders, corfu4sliders].flat;
allnums = [sapporo1nums, sapporo2nums, corfu3nums, corfu4nums].flat;

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
window = \sensors.bl_.window;
window.v(
	*allsensors.collect({ | s, i |
		HLayout(
			StaticText()
			.font_(font)
			.string_(s)
			.minWidth_(120),
			allsliders[i],
			allnums[i]
			// Slider().orientation_(\horizontal),
			// NumberBox().maxWidth_(120).font_(font)
		)
	})
);
{ window.bounds = Rect(0, 0, 800, 500); }.defer(0.1);
window.addNotifier(IdeFantasy, '/sapporo', { | ... args |
	args.postln;
});
//:

allsensors = ["corfu", "sapporo"];

//:
collect: { | place |


};
