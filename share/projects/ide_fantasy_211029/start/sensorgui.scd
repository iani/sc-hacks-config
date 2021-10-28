/* 13 Sep 2021 22:40

*/

var corfu, athens, allsensors, font, window;
// var sapporo1sliders, sapporo2sliders, sapporo1nums, sapporo2nums;
var corfu1sliders, corfu2sliders, corfu1nums, corfu2nums;
var corfu3sliders, corfu4sliders, corfu3nums, corfu4nums;
var athens1sliders, athens2sliders, athens1nums, athens2nums;
var athens3sliders, athens4sliders, athens3nums, athens4nums;
var allsliders, allnums, allbusses;
var spec;
// var sapporosliders, sapporonums, corfusliders, corfunums;

corfu1sliders = { Slider().orientation_(\horizontal) } ! 3;
corfu2sliders = { Slider().orientation_(\horizontal) } ! 3;
corfu3sliders = { Slider().orientation_(\horizontal) } ! 3;
corfu4sliders = { Slider().orientation_(\horizontal) } ! 3;

athens1sliders = { Slider().orientation_(\horizontal) } ! 3;
athens2sliders = { Slider().orientation_(\horizontal) } ! 3;
athens3sliders = { Slider().orientation_(\horizontal) } ! 3;
athens4sliders = { Slider().orientation_(\horizontal) } ! 3;

font = Font("Helvetica", 24);

corfu1nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;
corfu2nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;
corfu3nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;
corfu4nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;

athens1nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;
athens2nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;
athens3nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;
athens4nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;


allsliders = [athens1sliders, athens2sliders, corfu3sliders, corfu4sliders];
allnums = [athens1nums, athens2nums, corfu3nums, corfu4nums];

corfu = [1, 2] collect: { | n |
	[\x, \y, \z] collect: { | d |
		format("corfu%%", n, d)
	}
};

corfu = corfu.flat;

athens = [1, 2] collect: { | n |
	[\x, \y, \z] collect: { | d |
		format("athens%%", n, d)
	}
};

athens = athens.flat;

allbusses = (corfu ++ athens) collect: { | bn | bn.asSymbol.bus };
allbusses = allbusses.clump(3);
// allbusses[1].postln;
// allbusses[2].postln;

allsensors = (corfu ++ athens);
window = \sensors.bl_.window;
window.v(
	*allsensors.collect({ | s, i |
		HLayout(
			StaticText()
			.font_(font)
			.string_(s)
			.minWidth_(120),
			allsliders.flat[i],
			allnums.flat[i]
		)
	})
);

{ window.bounds = Rect(0, 0, 800, 500); }.defer(0.1);

spec = [0.47, 0.54].asSpec;

window.addNotifier(IdeFantasy, '/corfu', { | n, id ... nums |
	// TODO: Add project gui button to open/close this window
	var sliders, numboxes, busses;
	// "the notifier received sapporo from fantasy".postln;
	id = [0, 0, 1][id - 1];
	sliders = allsliders[id];
	numboxes = allnums[id];
	busses = allbusses[id];
	{
		nums do: { | val, i |
			val = spec.unmap(val);
			numboxes[i].value_(val);
			sliders[i].value_(val);
			// TODO: set busses separately with Bus.addNotifier(...)
			// So they continue to work when window is closed
			busses[i].set(val);
		};
	}.defer;
});

window.addNotifier(IdeFantasy, '/athens', { | n, id ... nums |
	// TODO: Add project gui button to open/close this window
	var sliders, numboxes, busses;
	// "the notifier received sapporo from fantasy".postln;
	id = id - 1;
	sliders = allsliders[id];
	numboxes = allnums[id];
	busses = allbusses[id];
	{
		nums do: { | val, i |
			val = spec.unmap(val);
			numboxes[i].value_(val);
			sliders[i].value_(val);
			// TODO: set busses separately with Bus.addNotifier(...)
			// So they continue to work when window is closed
			busses[i].set(val);
		};
	}.defer;
})