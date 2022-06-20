/*
	OpenAir.scad

	Copyright 2022 G. Adam Stanislav
	All rights reserved

	Redistribution and use in source and binary forms,
	with or without modification, are permitted provided
	that the following conditions are met:

	1. Redistributions of source code must retain the
	above copyright notice, this list of conditions
	and the following disclaimer.

	2. Redistributions in binary form must reproduce the
	above copyright notice, this list of conditions and
	the following disclaimer in the documentation and/or
	other materials provided with the distribution.

	3. Neither the name of the copyright holder nor the
	names of its contributors may be used to endorse or
	promote products derived from this software without
	specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS
	AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
	WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
	IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
	FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
	SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
	FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
	OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
	PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
	DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
	CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
	STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
	OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/

// This script can be processed by OpenSCAD.
//
// The fonts used here can be downloaded
// from https://github.com/Pantarheon/OpenAir
// for free.

module OpenAirEngrave(txt="Hello, World",
	fontsize = 0,
	hshift = 0,
	vshift = 5,
	zshift = 0,
	extrusion = 0,
	overlap = -1,
	segments = 0) {

	Slovo = txt;
	FontSize = (fontsize > 0) ? fontsize : 50;
	HorizontalShift = hshift;
	VerticalShift = vshift;
	ZShift = zshift;
	Extrusion = (extrusion > 0) ? extrusion : 1;
	Overlap = ((overlap >= 0) && (overlap < Extrusion)) ? overlap : 0.2 * Extrusion;
	Segments = (segments > 0) ? segments : 100;

	translate([HorizontalShift,VerticalShift,0*Extrusion+ZShift]) {
		linear_extrude(Extrusion) 
		text(Slovo, font="Open Air Wall", size=FontSize, $fn=Segments);
	}

	translate([HorizontalShift,VerticalShift,1*Extrusion+ZShift-Overlap]) {
		linear_extrude(Extrusion+Overlap)
		text(Slovo, font="Open Air Window", size=FontSize, $fn=Segments);
	}

	translate([HorizontalShift,VerticalShift,2*Extrusion+ZShift-Overlap]) {
		linear_extrude(Extrusion+Overlap)
		text(Slovo, font="Open Air Duct", size=FontSize, $fn=Segments);
	}
}


module OpenAirRaise(txt="Hello, World",
	fontsize = 0,
	hshift = 0,
	vshift = 5,
	zshift = 0,
	extrusion = 0,
	segments = 0) {

	Slovo = txt;
	FontSize = (fontsize > 0) ? fontsize : 50;
	HorizontalShift = hshift;
	VerticalShift = vshift;
	ZShift = zshift;
	Extrusion = (extrusion > 0) ? extrusion : 1.5;
	Segments = (segments > 0) ? segments : 100;

	difference() {
		difference() {
			translate([HorizontalShift,VerticalShift,0*Extrusion+ZShift]) {
				linear_extrude(Extrusion*3) 
				text(Slovo, font="Open Air Wall", size=FontSize, $fn=Segments);
			}

			translate([HorizontalShift,VerticalShift,1*Extrusion+ZShift]) {
				linear_extrude(Extrusion*2)
				text(Slovo, font="Open Air Duct", size=FontSize, $fn=Segments);
			}
		}

		translate([HorizontalShift,VerticalShift,2*Extrusion+ZShift]) {
			linear_extrude(Extrusion)
			text(Slovo, font="Open Air Window", size=FontSize, $fn=Segments);
		}
	}
}