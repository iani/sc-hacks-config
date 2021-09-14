/* 13 Sep 2021 22:40

*/

var corfu, sapporo, allsensors, font, window;
var sapporo1sliders, sapporo2sliders, sapporo1nums, sapporo2nums;
var corfu3sliders, corfu4sliders, corfu3nums, corfu4nums;
var allsliders, allnums, allbusses;
var spec;
// var sapporosliders, sapporonums, corfusliders, corfunums;

sapporo1sliders = { Slider().orientation_(\horizontal) } ! 3;
sapporo2sliders = { Slider().orientation_(\horizontal) } ! 3;
corfu3sliders = { Slider().orientation_(\horizontal) } ! 3;
corfu4sliders = { Slider().orientation_(\horizontal) } ! 3;

font = Font("Helvetica", 24);
sapporo1nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;
sapporo2nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;
corfu3nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;
corfu4nums = { NumberBox().font_(font).maxWidth_(120) } ! 3;

allsliders = [sapporo1sliders, sapporo2sliders, corfu3sliders, corfu4sliders];
allnums = [sapporo1nums, sapporo2nums, corfu3nums, corfu4nums];

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

allbusses = [sapporo, corfu].flat collect: { | bn | bn.asSymbol.bus };
allbusses = allbusses.clump(3);
allbusses[1].postln;
// allbusses[2].postln;

allsensors = [sapporo, corfu].flat;
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

window.addNotifier(IdeFantasy, '/sapporo', { | n, id ... nums |
	// TODO: Add project gui button to open/close this window
	var sliders, numboxes, busses;
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
});
